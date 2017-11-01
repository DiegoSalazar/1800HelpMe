require 'spec_helper'

RSpec.describe VoiceRecogService, type: :model do
  subject { described_class.new }
  let(:diego_call1) { create :call, :from_diego1 }

  context '#decode' do
    let(:decoded) { subject.decode diego_call1 }

    it 'is a speech object' do
      expect(decoded).to be_a Google::Cloud::Speech::Result
    end

    it 'almost decodes my speech' do
      expect(decoded.transcript).to eq 'Diego Salas'
    end
  end
end
