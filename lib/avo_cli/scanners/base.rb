require "ruby-lsp"
require "prism"
require "parser/prism"

class AvoCli::Scanners::Base
  attr_reader :path
  attr_reader :scan

  def initialize(path:, scan:)
    @path = path
    @scan = scan
  end
end
