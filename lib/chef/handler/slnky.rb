require "chef/handler/slnky/version"
require 'chef/handler'
require 'slnky'

class Chef
  class Handler
    class SlnkyHandler < Chef::Handler

      def report
        event = "chef.run.#{run_status.success? ? 'success' : 'failure'}"
        server = node['slnky']['url']
        data = {
            name: event,
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
