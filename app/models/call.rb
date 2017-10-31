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

class Call < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :parent_call, optional: true, class_name: 'Call', foreign_key: 'parent_id'
  has_many :children, class_name: 'Call', foreign_key: 'parent_id'
end
