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

class PhoneNumber < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
end
