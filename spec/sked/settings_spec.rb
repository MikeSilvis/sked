require 'spec_helper'

describe Sked::Settings do
  describe '#method_missing' do
    let(:sample_hash) { { sample_setting: 'value' } }
    before { expect(YAML).to receive(:load_file).and_return(sample_hash) }
    it 'returns values from the YAML file' do
      expect(Sked::Settings.sample_setting).to eq('value')
    end
  end
end
