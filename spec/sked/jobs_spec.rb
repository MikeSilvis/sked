require 'spec_helper'

describe Sked::Jobs do
  let!(:all_jobs) { Sked::Jobs.all }
  before { Sked::Jobs.class_variable_set(:@@all, []) }
  after { Sked::Jobs.class_variable_set(:@@all, all_jobs) }
  let(:job_hash) { {:time => 0, :type => :daily, :class => Sked::Jobs} }
  before { Sked::Jobs.append_job(job_hash) }
  describe '#append_job' do
    it 'adds the job to be nun' do
      expect(Sked::Jobs.all).to include(job_hash)
    end
  end
  describe '#run_jobs' do
    before do
      expect(Sked::Heroku).to receive(:restart)
      expect(Sked::Jobs).to receive(:superclass)
    end
    it do
      Sked::Jobs.run_jobs(:daily) do |job|
        job[:class].superclass
      end
    end
  end
end
