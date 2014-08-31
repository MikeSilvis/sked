module Sked
  class Jobs
    class << self
      def all
        @@all ||= []
      end

      def append_job(job)
        all << job
      end

      def run_jobs(type, &block)
        all.each do |job|
          next unless job[:type] == type
          yield(job)
          Sked::Heroku.restart
        end
      end
    end
  end
end
