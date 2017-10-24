require 'spec_helper'

RSpec.describe CreateCallService, type: :model do
  subject { described_class.new }

  context '#call' do
    it 'creates a Call' do
      expect { subject.call params }.to change { Call.count }.by 1
    end
  end

  let :params do
    {
      Called: '+15554443322',
      ToState: 'SS',
      CallerCountry: 'US',
      Direction: 'inbound',
      CallerState: 'FL',
      ToZip: '11111',
      CallSid: 'XXX',
      To: '+15612209886',
      CallerZip: '33433',
      ToCountry: 'US',
      ApiVersion: '2010-04-01',
      CalledZip: '33404',
      CalledCity: 'WEST PALM BEACH',
      CallStatus: 'ringing',
      From: '+15554443333',
      AccountSid: 'XXX',
      CalledCountry: 'US',
      CallerCity: 'DELRAY BEACH',
      Caller: '+15554443333',
      FromCountry: 'US',
      ToCity: 'WEST',
      FromCity: 'BEACH',
      CalledState: 'FL',
      FromZip: '55555',
      FromState: 'SS'
    }
  end
end
