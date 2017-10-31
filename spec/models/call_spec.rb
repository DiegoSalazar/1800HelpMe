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

require 'rails_helper'

RSpec.describe Call, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
