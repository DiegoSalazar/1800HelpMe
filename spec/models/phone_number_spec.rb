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

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
