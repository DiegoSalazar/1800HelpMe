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

class Contact < ApplicationRecord
  include Nameable
  include Contactable
  include Searchable

  belongs_to :user
  default_scope { order :created_at }
end
