require "bundler/setup"
require "dry/cli"
require "active_support/core_ext/class/attribute"
require "yaml"
require "tty-command"
require "fileutils"
require "active_support/core_ext/string"
require "pathname"
require "rubygems"
require "zeitwerk"
require "awesome_print"
require_relative "support"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/support.rb")
loader.inflector.inflect(
  "cli" => "CLI"
)
loader.setup

module AvoCli
  PACKED = !File.exist?("../spec")
end
