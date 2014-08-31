require 'sinatra'

module Sked
  class Web < Sinatra::Base
    use Rack::Auth::Basic, "Protected Area" do |username, password|
      username == (ENV['USERNAME'] || 'admin') && password == (ENV['PASSWORD'] || 'password')
    end

    set :views, settings.root + '/public/views'

    get '/' do
      erb :index
    end
  end
end
