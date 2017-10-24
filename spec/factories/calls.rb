# == Schema Information
#
# Table name: calls
#
#  id                 :integer          not null, primary key
#  called             :string
#  from               :string
#  direction          :string
#  status             :string
#  recording_url      :text
#  recording_duration :integer
#  call_sid           :string
#  account_sid        :string
#  from_zip           :string
#  from_city          :string
#  from_state         :string
#  from_country       :string
#  meta               :hstore
#  recognized_speech  :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  parent_id          :integer
#

FactoryGirl.define do
  factory :call do
    called "MyString"
    recording_url "MyString"
    meta "MyText"
    recording_duration 1
  end
end
