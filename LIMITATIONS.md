# mcelog Cookbook Limitations

## Supported Platforms

- **RHEL-based distributions (v8)**: AlmaLinux 8, Oracle Linux 8, and Rocky Linux 8.

## Unsupported Platforms

- **RHEL 7**: End of Life (June 2024).
- **RHEL 9 / AlmaLinux 9 / Rocky Linux 9**: `mcelog` is deprecated and removed from official repositories, replaced by `rasdaemon`.
- **Debian / Ubuntu**: `mcelog` is deprecated and removed from official repositories (starting with Debian 10 and Ubuntu 18.04), replaced by `rasdaemon`.

## Supported Architectures

- **x86_64**: Fully supported.
- **x86**: Supported (32-bit).
- **ARM64/POWER/RISC-V**: **NOT SUPPORTED**. These platforms use different mechanisms (e.g., `rasdaemon`) for hardware error reporting.

## Hardware Constraints

- **Intel CPUs**: Broadly supported for Machine Check Exceptions (MCE), ECC errors, and thermal events.
- **AMD CPUs**: Support is limited and often deprecated. Modern AMD processors (Family 16h+) are generally not supported by `mcelog`. `rasdaemon` is recommended for AMD hardware.
- **Virtualization**: `mcelog` is generally not installed on virtual machine guests as the hypervisor handles hardware errors.

## Transition Note

Modern Linux kernels and distributions have transitioned from `mcelog` to `rasdaemon`. This cookbook is intended for maintaining legacy hardware on supported RHEL 8-based systems.
