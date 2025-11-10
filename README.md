
# SUS Floating point wrapper library

[Xilinx floating_point IP](https://pdf4pro.com/view/floating-point-operator-v7-xilinx-609323.html) wrappers for the [SUS Hardware Design Language](https://github.com/pc2/sus-compiler). They have been instantiated with Non-blocking free-flowing pipeline semantics. Latencies are always set to "Use maximum latency", and annotated on the ports. Synchronization is handled by SUS' Latency Counting System. Additional custom operators are provided that aren't covered by the IP cores. 

<!-- Floating point library for SUS on Virtex Ultrascale+ (See Ultra) -->

### Versal
Wrappers for Versal devices are stored in [Versal/](Versal/). Use it by including [Versal/fp_wrappers.sus](Versal/fp_wrappers.sus) and [Versal/fp_custom.sus](Versal/fp_custom.sus) in your sus design, and adding all [`.xci` IP files](Versal/xci_files/) to your Vivado project.

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
