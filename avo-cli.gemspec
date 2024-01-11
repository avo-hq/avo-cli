require_relative "lib/avo_cli/version"

Gem::Specification.new do |spec|
  spec.name        = "avo-cli"
  spec.version     = AvoCli::VERSION
  spec.summary     = "Discontinued in favor of avo-cli"
  spec.description = "Discontinued in favor of avo-cli"
  spec.authors     = ["Adrian Marin"]
  spec.email       = "adrian@adrianthedev.com"
  spec.files       = Dir["{bin,lib}/**/*", "LICENSE.MD", "readme.md", "avo-cli.gemspec", "Gemfile", "Gemfile.lock", "linter.png"]
  spec.homepage    = "https://avohq.io"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["bug_tracker_uri"] = "https://github.com/avo-hq/avo-cli/issues"
    spec.metadata["changelog_uri"] = "https://github.com/avo-hq/avo-cli/releases"
    spec.metadata["documentation_uri"] = "https://github.com/avo-hq/avo-cli"
    spec.metadata["homepage_uri"] = "https://avohq.io"
    spec.metadata["source_code_uri"] = "https://github.com/avo-hq/avo-cli"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
    "public gem pushes."
  end

  spec.executables << "avo"
end
