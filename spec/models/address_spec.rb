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

require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
