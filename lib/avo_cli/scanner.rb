class AvoCli::Scanner
  AVO_PATHS = {
    actions: ["app", "avo", "actions", "*.rb"],
    config: ["config", "*.rb"],
    cards: ["app", "avo", "cards", "*.rb"],
    dashboards: ["app", "avo", "dashboards", "*.rb"],
    fields: ["app", "avo", "fields", "*.rb"],
    filters: ["app", "avo", "filters", "*.rb"],
    models: ["app", "models", "*.rb"],
    resource_controllers: ["app", "controllers", "avo", "*.rb"],
    resource_tools: ["app", "avo", "resource_tools", "*.rb"],
    resources: ["app", "avo", "resources", "*.rb"],
    scopes: ["app", "avo", "scopes", "*.rb"],
    views: ["app", "views", "avo", "*.rb"]
  }

  def self.scan(path: Dir.pwd)
    scan = new
    AvoCli::Scanners::ResourceScanner.new(path:, scan:).scan!
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
    results.map(&:errors).flatten
  end

  def errors?
    errors.present?
  end
end
