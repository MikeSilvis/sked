require './lib/sked'

environment ENV['RACK_ENV']
workers Sked::Settings.puma.workers
threads Sked::Settings.puma.threads_1, Sked::Settings.puma.threads_2
preload_app!

on_worker_boot do
  @sidekiq_pid ||= spawn("bundle exec sidekiq -r ./lib/sked.rb")
end
