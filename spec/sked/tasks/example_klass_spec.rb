require 'spec_helper'
require_relative '../../fixtures/example_klass.rb'

describe ExampleKlass do
  let(:job_classes) { Sked::Jobs.all.map { |h| h[:class] } }
  describe '#append_job' do
    it { expect(job_classes).to include(ExampleKlass) }
  end
end
