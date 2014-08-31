require 'yaml'
require 'byebug'
require 'hashie'

module Sked
  module Settings
    class << self
      def config
        @@config ||= Hashie::Mash.new(yaml_file)
      end
      def yaml_file
        @@yaml_file ||= YAML.load_file('./config/settings.yml')
      end
      def method_missing(m, *args, &block)
        if config.respond_to?(m)
          config.send(m)
        else
          super
        end
      end
    end
  end
end
