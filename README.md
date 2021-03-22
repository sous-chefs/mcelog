# mcelog Cookbook

[![Cookbook Version](https://img.shields.io/cookbook/v/mcelog.svg)](https://supermarket.chef.io/cookbooks/mcelog)
[![CI State](https://github.com/sous-chefs/mcelog/workflows/ci/badge.svg)](https://github.com/sous-chefs/mcelog/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Installs and configures mcelog for decoding kernel hardware error messages on Linux.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- Debian 9 (10+ does not include mcelog)
- RHEL based distros 7+

### Chef

- Chef 12.15+

### Cookbooks

default - installs and configures mcelog

## Attributes

### config options

- `default['mcelog']['cpu']` = nil
- `default['mcelog']['cpumhz']` = nil
- `default['mcelog']['filter']` = 'yes'
- `default['mcelog']['dmi']` = 'no'

### logging options

- `default['mcelog']['syslog']` = 'yes'
- `default['mcelog']['syslog-error']` = 'yes'
- `default['mcelog']['logfile']` = '/var/log/mcelog' # this can only be used if syslog is not active
- `default['mcelog']['filter-memory-errors']` = 'no'
- `default['mcelog']['raw']` = 'no'

### user/group settings

- `default['mcelog']['run-credentials-user']` = 'root'
- `default['mcelog']['run-credentials-group']` = 'root'
- `default['mcelog']['server']['client-user']` = 'root'
- `default['mcelog']['server']['client-group']` = 'root'

### dimm monitoring settings

- `default['mcelog']['dimm']['dimm-tracking-enabled']` = 'yes'
- `default['mcelog']['dimm']['dmi-prepopulate']` = 'yes'
- `default['mcelog']['dimm']['uc-error-threshold']` = '1 / 24h'
- `default['mcelog']['dimm']['ce-error-threshold']` = '10 / 24h'

### cpu monitoring settings

- `default['mcelog']['socket']['socket-tracking-enabled']` = 'yes'
- `default['mcelog']['socket']['mem-uc-error-threshold']` = '100 / 24h'
- `default['mcelog']['socket']['mem-ce-error-trigger']` = 'socket-memory-error-trigger'
- `default['mcelog']['socket']['mem-ce-error-threshold']` = '100 / 24h'
- `default['mcelog']['socket']['mem-ce-error-log']` = 'yes'

### cpu cache settings

- `default['mcelog']['cache']['cache-threshold-trigger']` = 'cache-error-trigger'
- `default['mcelog']['cache']['cache-threshold-log']` = 'yes'

### memory page settings

- `default['mcelog']['page']['memory-ce-threshold']` = '10 / 24h'
- `default['mcelog']['page']['memory-ce-log']` = 'yes'
- `default['mcelog']['page']['memory-ce-action']` = 'soft'

### trigger settings

- `default['mcelog']['trigger']['children-max']` = 2
- `default['mcelog']['trigger']['directory']` = '/etc/mcelog'

## Usage

Apply the default recipe to the node.

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
