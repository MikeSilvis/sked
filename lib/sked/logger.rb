module Sked
  module Logger
    def puts(string)
      Sked.redis.append(log_key, "#{string}\n")
      super(string)
    end

    def logs(date = Date.today)
      Sked.redis.get(log_key(date))
    end

    def log_key(date = Date.today)
      "#{job_key(date)}:logs"
    end

    def job_key(date = Date.today)
      "jobs:#{self.class}:#{date}"
    end
  end
end
