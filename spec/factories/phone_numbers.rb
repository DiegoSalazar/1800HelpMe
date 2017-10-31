# == Schema Information
#
# Table name: phone_numbers
#
#  id               :integer          not null, primary key
#  contactable_id   :integer
#  contactable_type :string
#  number           :string
#  phone_type       :string
#  primary          :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :phone_number do
    number { Faker::PhoneNumber.phone_number }
    phone_type { %w(mobile home work).sample }
  end
end
