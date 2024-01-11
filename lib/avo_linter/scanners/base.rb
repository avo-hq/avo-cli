require "ruby-lsp"
require "prism"
require "parser/prism"

class AvoLinter::Scanners::Base
  attr_reader :path
  attr_reader :scan

  def initialize(path:, scan:)
    @path = path
    @scan = scan
  end

  # def scan
  #   puts ["scanning->"].inspect

  #   # files.each do |file|
  #   #   puts file
  #   # end
  #   # ap files

  #   file_path = "/Users/adrian/work/avocado/avohq.io-v3/app/avo/resources/account.rb"
  #   file_path = "/Users/adrian/work/avocado/gems/avo-linter/account.rb"
  #   contents = File.read(file_path)
  #   # puts ["contents->", contents].inspect
  #   # @index = RubyIndexer::Index.new
  #   # puts ["@index->", @index].inspect
  #   # return
  #   if false
  #     parsed = Parser::Prism.parse_file file_path
  #     puts ["parsed->", parsed].inspect
  #   else
  #     # parsed = Prism.parse contents
  #     # fields_tree = parsed.value.statements.body.first.body.body.find do |item|
  #     #   puts ["item->", item.class].inspect
  #     #   item.instance_of?(Prism::DefNode) && item.name == :fields
  #     #   # matches?(item, Prism::DefNode)
  #     # end

  #     # scan_resource_files
  #     AvoLinter::Scanners::ResourceScanner.new.scan

  #     # fields =
  #     # puts ["fields_tree!!->", get_fields_in_fields_method(contents)].inspect
  #     # puts ["apply->", AvoLinter::Rules::FieldsAsClassMethods.new.apply].inspect
  #     # puts ["parsed->", parsed.value.statements.body.first.body.body].inspect
  #   end
  # end

  private

  def files
    # # Read ignore patterns from the .gitignore file in the directory
    gitignore_path = File.join(path, ".gitignore")
    ignore_patterns = get_ignore_patterns_from_gitignore(gitignore_path)
    puts ["ignore_patterns->", ignore_patterns].inspect

    get_all_files_in_directory_and_subdirectories(path, ignore_patterns)
  end

  def paths_to_scan
    [
      ["app", "avo", "**", "*.rb"],
      ["app", "controllers", "avo", "**", "*.rb"],
      ["app", "models", "**", "*.rb"],
      ["app", "views", "avo", "**", "*.erb"],
      ["config", "**", "*.rb"]
    ]
  end

  def get_ignore_patterns_from_gitignore(gitignore_path)
    ignore_patterns = []

    if File.exist?(gitignore_path)
      File.readlines(gitignore_path).each do |line|
        # Remove leading and trailing whitespace
        pattern = line.strip
        next if pattern.empty? || pattern.start_with?("#") # Skip comments and empty lines
        ignore_patterns << pattern
      end
    end

    ignore_patterns
  end

  def get_all_files_in_directory_and_subdirectories(directory, ignore_patterns)
    all_files = []

    # ap paths_to_scan
    # return []
    paths_to_scan.each do |path_to_scan|
      Dir.glob(File.join(*path_to_scan)).each do |file|
        next if File.directory?(file)
        # next if ignore_patterns.any? { |pattern| File.fnmatch?(pattern, file) }

        all_files << File.expand_path(file)
      end
    end

    all_files.flatten
  end
end
