class AvoLinter::Scanner
  def self.scan(path = Dir.pwd)
    scan = new
    AvoLinter::Scanners::ResourceScanner.new(path:, scan:).scan!
    scan
  end

  attr_reader :results

  def initialize
    @results = []
  end

  def error_messages
    errors.flatten.map do |error|
      error[:message]
    end
  end

  def errors
    results.map(&:errors)
  end

  def errors?
    errors.present?
  end
end
