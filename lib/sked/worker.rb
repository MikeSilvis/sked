begin
  require 'sidekiq'
rescue LoadError
  # No sidekiq, nothing to see here
end

module Sked
  module Worker
    include Sked::Logger

    def self.included(base)
      base.extend(ClassMethods)
      base.include(::Sidekiq::Worker) if defined? ::Sidekiq
    end

    module ClassMethods
      def append_job(job)
        Sked::Jobs.append_job(job.merge!(:class => self))
      end
    end
  end
end
