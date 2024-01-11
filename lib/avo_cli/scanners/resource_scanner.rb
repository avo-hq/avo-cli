class AvoCli::Scanners::ResourceScanner < AvoCli::Scanners::Base
  def scan!
    resource_files.map do |path, contents|
      results = AvoCli::Rules::FieldsAsClassMethods.new(contents:).apply_rule
      scan.results << results
    end
  end

  private

  def resource_files
    resource_file_paths.map do |file_path|
      [file_path, File.read(file_path)]
    end.to_h
  end

  def resource_file_paths
    all_files = []

    Dir.glob(File.join(path, *AvoCli::Scanner::AVO_PATHS[:resources])).each do |file|
      next if File.directory?(file)
      all_files << file
    end

    all_files
  end
end
