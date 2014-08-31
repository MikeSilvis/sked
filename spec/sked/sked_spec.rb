require 'spec_helper'

describe Sked do
  describe '#redis' do
    before { expect(Redis).to receive(:new).once.and_call_original }
    let!(:redis) { Sked.redis }
    it 'returns a redis client' do
      expect(Sked.redis).to eq(redis)
    end
  end
end
