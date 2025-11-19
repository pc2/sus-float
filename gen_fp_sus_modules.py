import argparse
import json
from pathlib import Path
import re

class xci:
    def __init__(self, xci_file_path):
        with open(xci_file_path, "r") as xci_file:
            self.xci_obj = json.load(xci_file)
        self.stack = []
        self.curr_item = self.xci_obj
        
        self.push("ip_inst")
        self.xci_name = self.get("xci_name")
        if xci_file_path.stem != self.xci_name:
            print("[ERROR] xci file {xci_file_path.stem} does not match the xci_name: {self.xci_name}")
            exit()
        
        # Sanity checks
        self.push("parameters")
        self.push("component_parameters")
        
        self.input_prec = self.get("A_Precision_Type")[0]["value"]
        self.result_prec = self.get("Result_Precision_Type")[0]["value"]

        if self.input_prec != self.result_prec:
            print(f"[WARNING] {self.xci_name} - input precision 'self.input_prec' does not match the result precision 'self.result_prec'")

        if self.input_prec not in ["Single", "Double"]:
            print(f"[ERROR] {self.xci_name} - currently only single and double precision supported, but {self.input_prec} is used")
            exit()

        if self.input_prec == "Single" and not self.xci_name.startswith("fp32"):
            print(f"[ERROR] {self.xci_name} - single precision is used but {self.xci_name}.xci indicates different precision")
            exit()
        
        if self.input_prec == "Double" and not self.xci_name.startswith("fp64"):
            print(f"[ERROR] {self.xci_name} - double precision is used but {self.xci_name}.xci indicates different precision")
            exit()

        flow_control = self.get("Flow_Control")[0]["value"]
        with_result_tready = self.get("Has_RESULT_TREADY")[0]["value"].lower() == "true"
        if flow_control != "NonBlocking" or with_result_tready:
            print(f"[ERROR] {self.xci_name} - operation is not configured as non-blocking")
            exit()
        
        with_aresetn = self.get("Has_ARESETn")[0]["value"].lower() == "true"
        with_a_tlast = self.get("Has_A_TLAST")[0]["value"].lower() == "true"
        with_b_tlast = self.get("Has_B_TLAST")[0]["value"].lower() == "true"
        with_c_tlast = self.get("Has_C_TLAST")[0]["value"].lower() == "true"

        if with_a_tlast and not with_aresetn:
            print(f"[ERROR] {self.xci_name} - has tlast signal but no aresetn")
            exit()

        if with_b_tlast:
            print(f"[ERROR] {self.xci_name} - configured with b_tlast")
            exit()
        
        if with_c_tlast:
            print(f"[ERROR] {self.xci_name} - configured with c_tlast")
            exit()
    
        self.pop()
        self.push("runtime_parameters")
        synthesis_flow = self.get("SYNTHESISFLOW")[0]["value"]
        if synthesis_flow != "GLOBAL":
            print(f"[ERROR] {self.xci_name} - synthesis flow not configured as 'global' but as '{synthesis_flow}'")
            exit()

        self.reset()

    def push(self, key):
        self.stack.append(key)
        if key not in self.curr_item.keys():
            curr_tree = ".".join(self.stack)
            print(f"[ERROR] xci.push - key {curr_tree} not found in {self.xci_name}.xci!")
            exit()
        self.curr_item = self.curr_item[key]

    def get(self, key):
        if key not in self.curr_item.keys():
            curr_tree = ".".join(self.stack)
            print(f"[ERROR] xci.get - key {curr_tree} not found in {self.xci_name}.xci!")
            exit()
        return self.curr_item[key]
    
    def set(self, key, val):
        if key not in self.curr_item.keys():
            curr_tree = ".".join(self.stack)
            print(f"[ERROR] xci.set - key {curr_tree} not found in {self.xci_name}.xci!")
            exit()
        self.curr_item[key] = val

    def pop(self):
        self.curr_item = self.xci_obj
        self.stack.pop()
        for key in self.stack:
            self.curr_item = self.curr_item[key]

    def reset(self): 
        self.stack = []
        self.curr_item = self.xci_obj

    def __str__(self):
        return json.dumps(self.xci_obj, indent=2)

    def update_gen_paths(self, output_path):
        gen_dir = output_path / "gen/sources_1/ip"
        self.push("ip_inst")
        self.set("gen_directory", str(gen_dir.resolve()))

        self.push("parameters")
        self.push("runtime_parameters")
        self.set("OUTPUTDIR", [{"value" : str(gen_dir.resolve())}])
        self.reset()
 
    def generate_sus_module(self):
        self.push("ip_inst")
        xci_name = self.get("xci_name")
        self.push("parameters")
        self.push("component_parameters")
        latency = int(self.get("C_Latency")[0]["value"])
        
        sus_module_tmpl = f"""
extern module {xci_name} {{
    __ACLK
    __ARESETN
    __PORTS
}}

module {xci_name[:-3]} {{
    __ACLK
    __ARESETN
    {xci_name} ip
    __ARESETN_PROP
    action {xci_name[:-3]} : __ACTION_INPUTS -> __ACTION_OUTPUT {{
        __ACTION_PORTS
    }} else {{
        __RESET_VALIDS
    }}
}}
"""


        self.pop()
        self.pop()
        self.push("boundary")

        float_type_dict = {"Single" : "float", "Double" : "double"}

        num_input_signals = 0
        num_input_data = 0
        num_output_signals = 0
        num_output_data = 0

        ports = []
        action_inputs = []
        action_ports = []
        reset_valids = []
        

        for port in self.get("ports").keys():
            if port == "aclk":
                sus_module_tmpl = sus_module_tmpl.replace("__ACLK", "domain aclk")
            elif port == "aresetn":
                sus_module_tmpl = sus_module_tmpl.replace("__ARESETN_PROP", "ip.aresetn = aresetn")
                sus_module_tmpl = sus_module_tmpl.replace("__ARESETN", "input bool aresetn'0\n\n    domain data")
            else:
                if port.startswith("s_axis"):
                    if "tdata" in port:
                        ports.append(f"input {float_type_dict[self.input_prec]} {port}'0")
                        port_name = port[-7:-6]
                        action_inputs.append(f"{float_type_dict[self.input_prec]} {port_name}")
                        action_ports.append(f"ip.{port} = {port_name}")
                        num_input_data += 1
                    elif "tlast" in port:
                        ports.append(f"input bool {port}'0")
                        action_inputs.append(f"bool last")
                        action_ports.append(f"ip.{port} = last")
                    else:
                        ports.append(f"input bool {port}'0")
                        action_ports.append(f"ip.{port} = true")
                        reset_valids.append(f"ip.{port} = false")
                        num_input_signals += 1
                elif port.startswith("m_axis"):
                    if "tdata" in port:
                        if self.result_prec in float_type_dict:
                            ports.append(f"output {float_type_dict[self.result_prec]} {port}'{latency}")
                            sus_module_tmpl = sus_module_tmpl.replace("__ACTION_OUTPUT", f"{float_type_dict[self.result_prec]} res")
                            action_ports.append(f"res = ip.{port}")    
                            num_output_data += 1
                        else:
                            result_bitsize = int(self.get("ports")[port][0]["size_left"]) + 1
                            ports.append(f"output bool[{result_bitsize}] {port}'{latency}")
                            sus_module_tmpl = sus_module_tmpl.replace("__ACTION_OUTPUT", "bool res")
                            action_ports.append(f"res = ip.{port}[0]")    
                            num_output_data += 1
                    else:
                        ports.append(f"output bool {port}'{latency}")
                        action_ports.append(f"bool _{num_output_signals} = ip.{port} // Tie off")
                        num_output_signals += 1
        self.reset()

        if num_input_signals == 0 or num_input_data == 0 or num_output_signals == 0 or num_output_data == 0:
            print("[ERROR] Not enough (data) signals for axi slave or master: (atleast one of each required")
            print("\tnum_input_signals  = {num_input_signals}")
            print("\tnum_input_data     = {num_input_data}")
            print("\tnum_output_signals = {num_output_signals}")
            print("\tnum_output_data    = {num_output_data}")
            exit()
        
        action_inputs.sort(key = lambda x: x.split(" ")[1])

        sus_module_tmpl = sus_module_tmpl.replace("__PORTS", "\n    ".join(ports))
        sus_module_tmpl = sus_module_tmpl.replace("__ARESETN_PROP", "")
        sus_module_tmpl = sus_module_tmpl.replace("__ARESETN", "")
        sus_module_tmpl = sus_module_tmpl.replace("__ACTION_INPUTS", ", ".join(action_inputs))
        sus_module_tmpl = sus_module_tmpl.replace("__ACTION_PORTS", "\n        ".join(action_ports))
        sus_module_tmpl = sus_module_tmpl.replace("__RESET_VALIDS", "\n        ".join(reset_valids))

        if "__ACLK" in sus_module_tmpl:
            print("[ERROR] {self.xci_name} does not define a clock port (aclk)")
            exit()

        return sus_module_tmpl
                






arg_parser = argparse.ArgumentParser()
arg_parser.add_argument("--xci_dir", type=str, required=True, help="folder containing the xci files from which to generate the sus wrappers, (usually [prj]/[prj].srcs/sources_1/ip")
arg_parser.add_argument("-o", type=str, required=True, help="output folder to store generated sus file and modified xci files")

args = arg_parser.parse_args()

xci_dir_path = Path(args.xci_dir)
if not xci_dir_path.exists():
    print(f"[ERROR] xci_dir = {xci_dir_path.resolve()} does not exist")
    exit()

if not xci_dir_path.is_dir():
    print(f"[ERROR] xci_dir = {xci_dir_path.resolve()} is not a directory")
    exit()

output_path = Path(args.o)
output_path.mkdir(mode=0o755, parents=True, exist_ok=True)
xci_out_files_path = output_path / "xci_files"
xci_out_files_path.mkdir(mode=0o755, exist_ok=True)

fp_mod_pattern = re.compile("^fp\d\d_.*_ip$")

sus_file_content = ""

# collect and sort xci files deterministically by their path relative to xci_dir_path
xci_files = sorted(xci_dir_path.glob("**/*.xci"), key=lambda p: str(p.relative_to(xci_dir_path)))

for xci_path in xci_files:
    if fp_mod_pattern.match(xci_path.stem):
        xci_obj = xci(xci_path)
        xci_obj.update_gen_paths(output_path)

        dest_file = xci_out_files_path / xci_path.name
        with open(dest_file, "w") as xci_file:
            xci_file.write(str(xci_obj))

        sus_file_content += xci_obj.generate_sus_module()

with open(output_path / "fp_wrappers.sus", "w") as sus_file:
    sus_file.write(sus_file_content)

    



