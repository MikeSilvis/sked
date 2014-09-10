#!/usr/bin/env rake

namespace :sked do
  task :all => :hourly
  task :all => :daily

  desc 'Cron job to run daily events at a specific hour'
  task :daily do
    Sked::Jobs.run_jobs(:daily) do |job|
      job[:class].perform_async if Time.now.utc.hour == job[:time]
    end
  end

  desc 'Cron jobs to run every hour'
  task :hourly do
    Sked::Jobs.run_jobs(:hourly) do |job|
      job[:class].perform_async
    end
  end
end
