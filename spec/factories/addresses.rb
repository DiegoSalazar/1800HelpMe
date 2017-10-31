# == Schema Information
#
# Table name: addresses
#
#  id               :integer          not null, primary key
#  contactable_id   :integer
#  contactable_type :string
#  address_type     :string
#  primary          :boolean
#  street1          :text
#  street2          :text
#  city             :string
#  state            :string
#  zip              :string
#  country          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :address do
    street1 { Faker::Address.street_address }
    street2 { Faker::Address.secondary_address if rand > rand }
    city { Faker::Address.city }
    state { Faker::Address.state }
    zip { Faker::Address.zip Faker::Address.state_abbr }
    country { Faker::Address.country }
  end
end
