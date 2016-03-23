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
    report_handlers << Chef::Handler::SlnkyHandler.new
    exception_handlers << Chef::Handler::SlnkyHandler.new

### Method 2

Use the
[chef_handler cookbook by Opscode](http://community.opscode.com/cookbooks/chef_handler).
Create a recipe with the following:

    include_recipe 'chef_handler::default'
    
    # Install the `chef-handler-slnky` RubyGem during the compile phase
    # the server that it sends the message to is managed with:
    # `node['slnky']['url']`
    # set this in a recipe or attributes file to point the handler
    # to the server
    chef_gem "chef-handler-slnky" do
      action :upgrade
    end
    
    # Then activate the handler with the `chef_handler` LWRP
    chef_handler "Chef::Handler::SlnkyHandler" do
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
