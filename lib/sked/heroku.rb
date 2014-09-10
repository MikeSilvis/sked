require 'heroku-api'

module Sked
  module Heroku
    class << self
      def restart
        if configured? && !running?
          client.post_ps_restart(settings.app_name)
        end
      end

      def client
        @@client ||= ::Heroku::API.new(api_key: settings.api_key) if configured?
      end

      def running?
        (client.get_ps(settings.app_name).body.first['pretty_state'] =~ /up/)
      end

      def configured?
        !!Sked::Settings.config.heroku
      end

      def settings
        Sked::Settings.heroku
      end
    end
  end
end
