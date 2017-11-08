require 'rails_helper'

feature 'My Contacts', type: :feature do
  given(:user) { create :user }

  context 'signed in' do
    before do
      signin user.email, user.password
    end

    scenario 'see list of my contacts' do
      visit my_contacts_path
      expect(page).to have_content "#{user.full_name}'s Contacts"
    end
  end
end
