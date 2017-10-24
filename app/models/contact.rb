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

class Contact < ApplicationRecord
  include Nameable
  include PgSearch
  pg_search_scope :search_by_full_name,
    against: [:first_name, :middle_name, :last_name],
    using: [:tsearch, :trigram, :dmetaphone]
  belongs_to :user
end
