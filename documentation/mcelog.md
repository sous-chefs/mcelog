# mcelog Resource

The `mcelog` resource installs and configures the `mcelog` daemon to catch and decode hardware errors from the Linux kernel.

## Example

```ruby
mcelog 'default' do
  syslog 'yes'
  dimm_tracking_enabled 'yes'
  action :install
end
```

## Properties

- `cpu` (String): CPU type to force.
- `cpumhz` (String): CPU speed in MHz.
- `filter` (String, default: `'yes'`): Enable/disable error filtering.
- `dmi` (String, default: `'no'`): Enable/disable DMI decoding.
- `syslog` (String, default: `'yes'`): Enable/disable syslog logging.
- `syslog_error` (String, default: `'yes'`): Enable/disable syslog error logging.
- `logfile` (String, default: `'/var/log/mcelog'`): Path to log file (used if syslog is disabled).
- `filter_memory_errors` (String, default: `'no'`): Enable/disable memory error filtering.
- `raw` (String, default: `'no'`): Enable/disable raw logging.
- `run_credentials_user` (String, default: `'root'`): User to run daemon as.
- `run_credentials_group` (String, default: `'root'`): Group to run daemon as.
- `client_user` (String, default: `'root'`): User allowed to connect to client socket.
- `client_group` (String, default: `'root'`): Group allowed to connect to client socket.
- `dimm_tracking_enabled` (String, default: `'yes'`): Enable/disable DIMM tracking.
- `dmi_prepopulate` (String, default: `'yes'`): Enable/disable DMI prepopulation.
- `uc_error_threshold` (String, default: `'1 / 24h'`): Uncorrected error threshold.
- `ce_error_threshold` (String, default: `'10 / 24h'`): Corrected error threshold.
- `socket_tracking_enabled` (String, default: `'yes'`): Enable/disable socket tracking.
- `mem_uc_error_threshold` (String, default: `'100 / 24h'`): Socket memory UC error threshold.
- `mem_ce_error_trigger` (String, default: `'socket-memory-error-trigger'`): Socket memory CE error trigger.
- `mem_ce_error_threshold` (String, default: `'100 / 24h'`): Socket memory CE error threshold.
- `mem_ce_error_log` (String, default: `'yes'`): Enable/disable socket memory CE error logging.
- `cache_threshold_trigger` (String, default: `'cache-error-trigger'`): Cache error threshold trigger.
- `cache_threshold_log` (String, default: `'yes'`): Enable/disable cache error threshold logging.
- `memory_ce_threshold` (String, default: `'10 / 24h'`): Memory CE threshold.
- `memory_ce_log` (String, default: `'yes'`): Enable/disable memory CE logging.
- `memory_ce_action` (String, default: `'soft'`): Action on memory CE threshold (soft/hard/off).
- `children_max` (Integer, default: `2`): Max number of trigger children.
- `trigger_directory` (String): Directory for triggers. Defaults based on platform.

## Actions

- `:install`: Installs the package, configures the daemon, and starts the service. (Default)
- `:remove`: Stops the service and removes the package and configuration.
- `:restart`: Restarts the `mcelog` service.
