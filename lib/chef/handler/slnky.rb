require "chef/handler/slnky/version"
require 'chef/handler'
require 'slnky'
require 'yaml'

class Chef
  class Handler
    class SlnkyHandler < Chef::Handler

      def report
        event = "chef.run.#{run_status.success? ? 'success' : 'failure'}"
        server = node['slnky']['url']
        file = node['slnky']['yaml']
        attrs = file && File.exists?(file) ? YAML.load_file(file) : {}
        data = {
            name: event,
            node: node.name,
            attributes: attrs,
            elapsed: run_status.elapsed_time,
            exception: run_status.exception,
            updated: run_status.updated_resources.count,
            total: run_status.all_resources.count,
        }
        msg = ::Slnky::Message.new(data)
        ::Slnky.notify(msg, server)
      end
    end
  end
end
