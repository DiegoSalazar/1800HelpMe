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
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :contact do
    user_id 1
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    email "MyString"
    phone "MyString"
  end
end
