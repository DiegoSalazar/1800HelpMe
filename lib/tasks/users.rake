namespace :users do
  desc 'Create a bunch of random users'
  task create_random_batch: :environment do
    min = ENV.fetch('min', 100).to_i
    max = ENV.fetch('max', 100).to_i
    num = min + rand(max)
    puts "Buulding #{num} users..."

    User.transaction do
      users = num.times.map do
        user = User.new FactoryBot.attributes_for :user

        user.contacts << FactoryBot.build_list(:contact, num)
        user.contacts.each do |contact|
          contact.phone_numbers << FactoryBot.build_list(:phone_number, rand(3) + 1)
          contact.addresses << FactoryBot.build_list(:address, rand(3) + 1)
        end

        user.phone_numbers << FactoryBot.build(:phone_number)
        user.addresses << FactoryBot.build(:address)
        print ?.
        user
      end

      puts nil, "Inserting Users..."
      User.import users, recursive: true
    end

    puts "\aDone."
  end

  desc "Clear users, and contacts, and their phone_numbers, and addresses"
  task clear: :environment do
    raise 'No.' if Rails.env.production?
    puts "Destroying Users and Contacts..."
    [User, Contact].map &:destroy_all
    puts "\aDone."
  end
end
