# mcelog Cookbook Limitations

## Supported Platforms
- **Debian/Ubuntu**: x86 and x86_64 architectures.
- **RHEL/CentOS/Oracle/Scientific**: x86 and x86_64 architectures.

## Supported Architectures
- **x86_64**: Fully supported.
- **x86**: Supported (32-bit).
- **ARM64/POWER/RISC-V**: **NOT SUPPORTED**. These platforms use different mechanisms (e.g., `rasdaemon`) for hardware error reporting.

## Hardware Constraints
- **Intel CPUs**: Broadly supported for Machine Check Exceptions (MCE), ECC errors, and thermal events.
- **AMD CPUs**: Support is limited and often deprecated. Modern AMD processors (Family 16h+) are generally not supported by `mcelog`. `rasdaemon` is recommended for AMD hardware.
- **Virtualization**: `mcelog` is generally not installed on virtual machine guests as the hypervisor handles hardware errors.

## Transition Note
Modern Linux kernels and distributions are transitioning from `mcelog` to `rasdaemon`. This cookbook focuses specifically on managing the `mcelog` daemon where required.
