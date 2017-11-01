require 'spec_helper'

RSpec.describe VoiceRecogService, type: :model do
  subject { described_class.new }
  let(:diego_call1) { create :call, :from_diego1 }
  let(:diego_call2) { create :call, :from_diego2 }

  context '#decode' do
    let(:decoded1) { subject.decode diego_call1 }
    let(:decoded2) { subject.decode diego_call2 }

    it 'is a speech object' do
      expect(decoded1).to be_a Google::Cloud::Speech::Result
    end

    it 'almost decodes my speech' do
      expect(decoded1.transcript).to eq 'Diego Salas'
    end

    it 'can decode correctly when enunciating well' do
      expect(decoded2.transcript).to eq 'Diego salazar'
    end
  end
end
