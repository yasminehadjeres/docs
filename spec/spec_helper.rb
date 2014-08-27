here = File.expand_path File.dirname(__FILE__)
top = File.expand_path "#{here}/.."
$: << "#{top}/lib"

require "rspec"
require "wrong/adapters/rspec"
require "nokogiri"
require "files"
require 'active_support/core_ext/string/strip'

def assert_loosely_equal lhs, rhs
  assert { lhs.gsub(/\n\s*/, '') == rhs.gsub(/\n\s*/, '') }
end

RSpec.configure do |c|
  c.include Files

  c.expect_with :rspec do |expectations|
    expectations.syntax = [:expect, :should]
  end

  c.mock_with :rspec do |mocks|
    mocks.syntax = [:should, :expect]
  end
end

