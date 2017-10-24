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

require 'rails_helper'

RSpec.describe Call, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
