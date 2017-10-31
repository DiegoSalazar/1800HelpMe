module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :phone_numbers, as: :contactable, dependent: :destroy
    has_many :addresses, as: :contactable, dependent: :destroy
  end

  def phone
    default_phone_number.number
  end

  def default_phone_number
    phone_numbers.first
  end
end
