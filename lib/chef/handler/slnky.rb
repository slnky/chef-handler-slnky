require "chef/handler/slnky/version"
require 'chef/handler'
require 'slnky'

class Chef
  class Handler
    class Slnky < Chef::Handler

      def report
        title = Chef::Config[:solo] ? "Chef Solo" : "Chef Client"
        text = if run_status.success?
                 "Chef complete on #{node.name} in #{run_status.elapsed_time}"
               else
                 "Chef failed on #{node.name} with #{run_status.exception}"
               end

      end
    end
  end
end
