module AvoCli
  module CLI
    module Commands
      extend Dry::CLI::Registry

      class BaseCommand < Dry::CLI::Command
        def run(command)
          result = cmd.run(command)
          halt if result.failed?
          result
        rescue TTY::Command::ExitError
          halt
        end

        def halt(message: nil)
          message ||= "#{self.class} failed."
          yell message
          exit
        end
      end

      class Version < BaseCommand
        desc "Print version"

        def call(*)
          if AvoCli::PACKED
            puts AvoCli::VERSION
          else
            puts "#{AvoCli::VERSION}-development"
          end
        end
      end

      class Lint < BaseCommand
        desc "Lint gem"

        option :path, aliases: ["-p"], required: false, desc: "Path of your Rails app"

        def call(**)
          scan = ::AvoCli::Scanner.scan

          say "Scan finished!\n"

          if scan.errors?
            yell "We found a couple of errors."
            ap scan.error_messages
          else
            say "Nothing bad found. Good job!"
          end
        end
      end

      register "version", Version, aliases: ["v", "-v", "--version"]

      register "lint", Lint
    end
  end
end

Dry::CLI.new(AvoCli::CLI::Commands).call
