module Searchable
  extend ActiveSupport::Concern
  include PgSearch

  included do
    pg_search_scope :search_by_full_name,
      against: [:first_name, :middle_name, :last_name],
      using: { tsearch: { any_word: true }, trigram: {}, dmetaphone: {}}
  end
end
