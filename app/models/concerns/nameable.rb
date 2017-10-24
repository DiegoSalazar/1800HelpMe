module Nameable
  def full_name
    [first_name, middle_name, last_name].reject(&:blank?).join ' '
  end
end
