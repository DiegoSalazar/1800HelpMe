namespace :users do
  desc 'Create a bunch of random users'
  task create_random_batch: :environment do
    min = ENV.fetch('min', 100).to_i
    max = ENV.fetch('max', 100).to_i
    num = min + rand(max)
    puts "Creating #{num} users..."

    User.transaction do
      users = num.times.map do
        user = FactoryBot.build :user
        user.contacts << FactoryBot.build_list(:contact, num)
        user.phone_numbers << FactoryBot.build(:phone_number)
        user.addresses << FactoryBot.build(:address)
        print ?.
        user
      end

      User.import users
      puts
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
