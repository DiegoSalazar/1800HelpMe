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

class Address < ApplicationRecord
  belongs_to :contactable, polymorphic: true, required: false
  validates :zip, numericality: true
end
