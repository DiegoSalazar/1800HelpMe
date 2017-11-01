# Builds the string to ask the caller which contact they would like
# e.g. "For John press 1, for Mary press 2..."
class ContactDigitMapperService
  def initialize(contacts)
    @contacts = contacts
    @size = contacts.size
  end

  def contacts_digits
    @contacts.map.with_index.with_object({}) { |(c, i), h| h[i + 1] = c.id }
  end

  def question_with_contacts_digits
    contacts_digits.each_with_object 'For ' do |(op, id), q|
      contact = @contacts.find { |c| c.id == id }
      q << "#{contact.full_name}, press #{op}. For "
    end.chomp ' For '
  end
end
