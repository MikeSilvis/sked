# rake tasks for Rails 3+
module Sked
  class Railtie < ::Rails::Railtie
    rake_tasks do
      require_relative './tasks'
    end
  end
end
