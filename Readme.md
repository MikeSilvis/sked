# Sked

## Purpose

Schedule daily jobs to run at a specific time using one global cron job.
(In my case Heroku Scheduler)

## Usage

Set up a cron job to run `bundle exec rake sked:all` and it will
automatically find all jobs that should be run at the specific time.

Include the following in any class that you want to run.

```
  include Sked::Worker
  append_job({:time => 0, :type => :daily})
```

The rake task automatically schedules it using a background job. It will
work with both resque and Sidekiq, or any other library that responds to
a `perform_async` method.

## Installation

Add this line to your application's Gemfile:

    gem 'sked'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Sked

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( http://github.com/mikesilvis/sked/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
