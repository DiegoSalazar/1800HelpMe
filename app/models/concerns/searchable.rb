module Searchable
  include PgSearch
  pg_search_scope :search_by_full_name,
    against: [:first_name, :middle_name, :last_name],
    using: { tsearch: { any_word: true }, trigram: {}, dmetaphone: {}}
  pg_search_scope :search_by_phone, against: [:phone]
end
