def say(text)
  puts "=> #{yellow(text)}"
end

def yell(text)
  puts "=> #{red(text)}"
end

def colorize(text, color_code)
  "#{color_code}#{text}\e[0m"
end

def yellow(text)
  colorize(text, "\e[33m")
end

def red(text)
  colorize(text, "\e[31m")
end

def green(text)
  colorize(text, "\e[32m")
end

def gemspec_path
  Dir["#{Dir.pwd}/*.gemspec"].first
end

def gemspec
  Gem::Specification.load(gemspec_path)
end

def version
  @version ||= gemspec.version.to_s
end

def gemspec_name
  gemspec.name
end

def cmd
  TTY::Command.new uuid: false
end

def change_in_file(file, regex, text_to_put_in_place)
  text = File.read file
  File.open(file, "w+") { |f| f << text.gsub(/#{regex}/, text_to_put_in_place) }
end

def bundler_token
  @token ||= `bundle config get https://packager.dev/avo-hq`.match(/^.*: "(.*)"$/).captures.first
end
