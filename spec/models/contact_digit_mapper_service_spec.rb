require 'spec_helper'

RSpec.describe ContactDigitMapperService, type: :model do
  subject { described_class.new contacts }
  let(:contacts) { create_list(:contact, 6).last 3 }

  context '#contacts_digits' do
    it 'is a mapping between a 1 indexed digit option and a contact id' do
      expect(subject.contacts_digits).to eq(1 => 4, 2 => 5, 3 => 6)
    end

    it 'is a question asking the caller to press an option for a contact' do
      contacts.each do |contact|
        expect(subject.question_with_contacts_digits).to include contact.full_name
      end
    end
  end

  context '#question_with_contact_digits' do
    it 'is a string'
  end
end
