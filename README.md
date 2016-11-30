# Simple Patcher Cookbook

The simplest system-patching cookbook you ever did see!

## Requirements

### Platforms

- Ubuntu (tested on 14.04, should work on 12.04+)

### Chef

- Chef 12.7.0+ (due to apt_update resource)

## Attributes

- `node['simple_patcher']['data_bag_name']` - Defines the name of a data bag that will store our patching information. This defaults to `#{node['platform']}_patchlist` (e.g. "ubuntu_patchlist").

- `node['simple_patcher']['data_bag_item_name']` - Defines the name of a data bag item that will store a list of packages and versions required by this name. This defaults to node.chef_envrionment (e.g. "production").

## Recipes

### default

Ensures the correct versions of our software are installed for the current environment. Iterates over the contents of a databag item, expecting a hash of names/versions structured like so:

```
{
  "id": "environment_name",
  "package": {
    "package1": "1.2.3.4-p5",
    "package2": "1.2.3ubuntu4.56"
  }
}
```

Each package is installed via the package resource, with the version specified. Will fail if this version is not available in your package repository.