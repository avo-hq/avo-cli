class AvoLinter::Scanners::ResourceScanner < AvoLinter::Scanners::Base
  # def initialize

  # end

  def scan!
    # puts ["resource_files->", resource_files].inspect

    # errors = []
    resource_files.map do |path, contents|
      results = AvoLinter::Rules::FieldsAsClassMethods.new(contents:).apply_rule
      scan.results << results
      # scan.errors << results.errors
    end
  end

  private

  # def scan_resource_files
  #   resource_files
  # end

  def resource_files
    resource_file_paths.map do |file_path|
      [file_path, File.read(file_path)]
    end.to_h
  end

  def resource_file_paths
    [
      "/Users/adrian/work/avocado/gems/avo-linter/account.rb"
    ]
  end
end
