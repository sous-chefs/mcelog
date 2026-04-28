# mcelog Migration Guide (v2.x to v3.x)

The `mcelog` cookbook has been fully migrated to a Custom Resource-based pattern. This is a major breaking change.

## Key Changes
- **Removed Recipes**: The `mcelog::default` recipe has been removed. Use the `mcelog` resource instead.
- **Removed Attributes**: All `node['mcelog']` attributes have been removed. Configure the resource using properties.
- **Unified Mode**: The new resource uses `unified_mode true`, requiring Chef Infra Client 15.3 or newer.

## Migration Steps

### 1. Update your run_list
If you were using `recipe[mcelog::default]`, you should now call the `mcelog` resource in your own wrapper cookbook.

**Old Pattern:**
```ruby
# In your run_list or wrapper recipe
include_recipe 'mcelog::default'
```

**New Pattern:**
```ruby
# In your wrapper recipe
mcelog 'default' do
  # Add properties here if you need to override defaults
end
```

### 2. Update Attribute Overrides
If you were overriding attributes in a role, environment, or wrapper cookbook, move those values to resource properties.

**Old Pattern (attributes):**
```ruby
node.default['mcelog']['syslog'] = 'no'
node.default['mcelog']['logfile'] = '/var/log/custom_mcelog'
```

**New Pattern (resource properties):**
```ruby
mcelog 'default' do
  syslog 'no'
  logfile '/var/log/custom_mcelog'
end
```

## Why the Change?
This migration follows the modern Chef practice of using resources instead of attribute-heavy recipes. It provides better encapsulation, easier testing with `step_into`, and clearer intent in your infrastructure code.
