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
    called "MyString"
    recording_url "MyString"
    meta "MyText"
    recording_duration 1
  end
end
