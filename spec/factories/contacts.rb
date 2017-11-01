# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  first_name  :string
#  middle_name :string
#  last_name   :string
#  email       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :contact do
    user_id {}
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.name_with_middle.split(' ')[1] if rand > rand }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    association :user, factory: :user
  end
end
