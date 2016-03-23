# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/handler/slnky/version'

Gem::Specification.new do |spec|
  spec.name          = "chef-handler-slnky"
  spec.version       = Chef::Handler::Slnky::VERSION
  spec.authors       = ["Shawn Catanzarite"]
  spec.email         = ["me@shawncatz.com"]

  spec.summary       = %q{send chef notifications to slnky}
  spec.description   = %q{send chef notifications to slnky}
  spec.homepage      = "https://github.com/slnky/chef-handler-slnky"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency 'slnky', '~> 0.7.0'
end
