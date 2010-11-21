require "rubygems"
require "rspec"

gem "activesupport"

require 'active_support/concern'
require 'active_support/core_ext/class/attribute_accessors'
require 'active_support/core_ext/load_error'
require 'active_support/core_ext/module/attr_internal'
require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/name_error'
require 'active_support/inflector'

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib', 'uv_refactor')
require "uv_refactor"

begin
  require 'ruby-debug'
rescue LoadError
end

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.mock_with :mocha
end
