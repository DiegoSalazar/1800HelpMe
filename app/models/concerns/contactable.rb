module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :phone_numbers, as: :contactable, dependent: :destroy
    has_many :addresses, as: :contactable, dependent: :destroy

    accepts_nested_attributes_for :phone_numbers, allow_destroy: true
    accepts_nested_attributes_for :addresses, allow_destroy: true
  end

  def phone
    default_phone_number.try :number
  end

  def default_phone_number
    phone_numbers.last
  end
end
