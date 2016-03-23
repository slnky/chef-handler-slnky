Description
===========

Shamelessly stolen from https://github.com/jtimberman/chef-handler-growl

This is a simple Chef report handler that reports status of a Chef run
through Slnky.

* http://wiki.opscode.com/display/chef/Exception+and+Report+Handlers

Requirements
============

Platform: Mac OS X

Usage
=====

There are two ways to use Chef Handlers.

### Method 1

You can install the RubyGem ahead of time, and configure Chef to use
them. To do so:

    gem install chef-handler-slnky

Then add to the configuration (`/etc/chef/solo.rb` for chef-solo or
`/etc/chef/client.rb` for chef-client):

    require "chef/handler/slnky"
    report_handlers << Chef::Handler::Slnky.new
    exception_handlers << Chef::Handler::Slnky.new

### Method 2

Use the
[chef_handler cookbook by Opscode](http://community.opscode.com/cookbooks/chef_handler).
Create a recipe with the following:

    # Install the `chef-handler-slnky` RubyGem during the compile phase
    chef_gem "chef-handler-slnky"
    node.set['slnky']['url']

    # Then activate the handler with the `chef_handler` LWRP
    chef_handler "Chef::Handler::Slnky" do
      source "chef/handler/slnky"
      action :enable
    end

Roadmap
=======

Things I would like to add:

* rspec tests - both Chef::Handler and GNTP#notify have specs, so this
  was low priority.

License and Author
==================

[see LICENSE.txt](LICENSE.txt)
