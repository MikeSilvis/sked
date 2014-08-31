require 'bundler'
Bundler.require
require 'redis'

require_relative './sked/logger'
require_relative './sked/worker'
require_relative './sked/jobs'
require_relative './sked/cli'
require_relative './sked/scaffold'
require_relative './sked/settings'
require_relative './sked/heroku'
require_relative './sked/web'

module Sked
  def self.redis
    @@redis ||= Redis.new(url: ENV['REDISTOGO_URL'])
  end
end
