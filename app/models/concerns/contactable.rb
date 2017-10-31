module Contactable
  extend ActiveSupport::Concern

  included do
    has_many :phone_numbers, as: :contactable, dependent: :destroy
    has_many :addresses, as: :contactable, dependent: :destroy
  end
end
