require 'erb'

module Sked
  class Scaffold
    attr_accessor :name
    WORKER_FILE_TEMPLATE = './lib/sked/templates/worker_file.rb.erb'
    GEMSPEC_FILE_TEMPLATE = './lib/sked/templates/gemspec.rb.erb'

    def initialize(name)
      self.name = name
    end

    def generate
      puts "Scaffolding a new worker under #{path}"
      create_dir
      create_ruby_file
      create_gemspec
    end

    def destroy
      puts "Removing worker located at #{path}"
      remove_dir
    end

    private

    def path
      "./lib/tasks/#{name}"
    end

    module Generate
      def create_dir
        `mkdir #{path}`
      end

      def create_ruby_file
        generate_template_file(ruby_file, WORKER_FILE_TEMPLATE)
      end

      def create_gemspec
        generate_template_file(gemspec_file, GEMSPEC_FILE_TEMPLATE)
      end

      def generate_template_file(new_file, template_location)
        File.open(new_file, 'w') do |file|
          file.write(ERB.new(File.read(template_location)).result(binding))
        end
      end
      def ruby_file
        "#{path}/#{name}.rb"
      end

      def gemspec_file
        "#{path}/#{name}.gemspec"
      end
    end
    include Generate

    module Destroy
      def remove_dir
        `rm -rf #{path}`
      end
    end
    include Destroy
  end
end
