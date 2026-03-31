
# SUS Floating point wrapper library

[Xilinx floating_point IP](https://pdf4pro.com/view/floating-point-operator-v7-xilinx-609323.html) wrappers for the [SUS Hardware Design Language](https://github.com/pc2/sus-compiler). They have been instantiated with Non-blocking free-flowing pipeline semantics. Latencies are always set to "Use maximum latency", and annotated on the ports. Synchronization is handled by SUS' Latency Counting System. Additional custom operators are provided that aren't covered by the IP cores. 

<!-- Floating point library for SUS on Virtex Ultrascale+ (See Ultra) -->

### Versal (Made with Vivado 23.1)
Wrappers for Versal devices are stored in [Versal/](Versal/). Use it by including [Versal/fp_wrappers.sus](Versal/fp_wrappers.sus) and [fp_custom.sus](fp_custom.sus) in your sus design, and adding all [`.xci` IP files](Versal/xci_files/) to your Vivado project. It's important to import the IP files as IP through `import_ip`, and not `add_files`. For example, the TCL command `import_ip [glob -type f xci_files/*.xci]` should work.

### UltraScalePlus (Made with Vivado 23.2)
Wrappers for Versal devices are stored in [UltraScalePlus/](UltraScalePlus/). Use it by including [UltraScalePlus/fp_wrappers.sus](UltraScalePlus/fp_wrappers.sus), [UltraScalePlus/extensions.sus](UltraScalePlus/extensions.sus) and [fp_custom.sus](fp_custom.sus) in your sus design, and adding all [`.xci` IP files](UltraScalePlus/xci_files/) to your Vivado project. It's important to import the IP files as IP through `import_ip`, and not `add_files`. For example, the TCL command `import_ip [glob -type f xci_files/*.xci]` should work.

#### Missing IPs for UltraScalePlus:
- fp32_acc_ip
- fp32_acc_minus_ip
- fp32_mac_ip
- fp32_msc_ip
- fp64_acc_ip
- fp64_acc_minus_ip

These IPs are not wrapped, because these require a fixed-point internal accumulation register, and are therefore not generic for all floating point operations. You can still create these yourself in Vivado if you have a specific precision range in mind. 

Partial reimplementations of them are provided in [UltraScalePlus/extensions.sus](UltraScalePlus/extensions.sus)

## Example
```sus
/// Computes roots of the polynomial `a*x^2 + b*x + c`. 
/// Calls roots_valid if the discriminant is positive
module ComputeRoots {
    action compute_roots : float a, float b, float c {
        trigger roots_valid : float root_1, float root_2

        float half_b = fp32_mul_pow2(b, -1)

        float discriminant = fp32_sub(fp32_mul(half_b, half_b), fp32_mul(a, c))
        float discr_sqrt = fp32_sqrt(discriminant)

        float a_recip = fp32_rcp(a)
        float half_b_neg = fp32_neg(half_b)
        when fp32_ge(discriminant, 0.0) {
            float r1 = fp32_mul(fp32_add(half_b_neg, discr_sqrt), a_recip)
            float r2 = fp32_mul(fp32_sub(half_b_neg, discr_sqrt), a_recip)
            roots_valid(r1, r2)
        }
    }
}
```
