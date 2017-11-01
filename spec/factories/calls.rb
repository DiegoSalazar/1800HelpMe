# == Schema Information
#
# Table name: calls
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  parent_id         :integer
#  from              :string
#  to                :string
#  status            :string
#  recording_url     :text
#  recognized_speech :text
#  meta              :hstore
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryBot.define do
  factory :call do
    recording_url {}
    meta {}

    trait :from_diego1 do
      recording_url 'https://api.twilio.com/2010-04-01/Accounts/AC0c5cf6c8a23ea564c466c710e8edc22a/Recordings/RE4f2c9d530ec2b97d76df19f9b83b5bb6'
    end

    trait :from_diego2 do
      recording_url 'https://api.twilio.com/2010-04-01/Accounts/AC0c5cf6c8a23ea564c466c710e8edc22a/Recordings/RE81517f62e4bc80ad55bab03c2dbf1ebc'
    end
  end
end
