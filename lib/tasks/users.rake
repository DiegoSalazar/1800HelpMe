namespace :users do
  desc 'Create a bunch of random users. Usage: rake users:test_seed[int_min,int_max]'
  task :test_seed, [:min, :max] => :environment do |t, args|
    min = args.fetch(:min, 100).to_i
    max = args.fetch(:max, 100).to_i
    num = min + rand(max)

    User.transaction do
      puts "Building #{num} users..."
      users = num.times.map { print ?.; create_user num }
      puts nil, "Inserting Users..."
      User.import users, recursive: true
    end

    puts "\aDone."
  end

  desc 'Create contacts for a user'
  task :create_contacts, [:user_id, :num_contacts] => :environment do |t, args|
    user = User.find args.fetch :user_id
    num = (args[:num_contacts] || 10).to_i

    Contact.transaction do
      puts "Building #{num} contacts for #{user.full_name}..."
      contacts = num.times.map { print ?.; build_contact_for user }
      Contact.import contacts, recursive: true
    end

    puts "\n\aDone."
  end

  desc "Clear users, and contacts, and their phone_numbers, and addresses"
  task :clear, [:override] => :environment do |t, args|
    raise 'No.' if Rails.env.production? && args[:override].blank?
    puts "Destroying Users and Contacts..."
    [User, Contact, Call, PhoneNumber, Address].map &:delete_all
    puts "\n\aDone."
  end

  def create_user(num)
    User.new(FactoryBot.attributes_for(:user)).tap do |user|
      user.contacts << FactoryBot.build_list(:contact, num)
      user.contacts.each do |contact|
        contact.phone_numbers << FactoryBot.build_list(:phone_number, rand(3) + 1)
        contact.addresses << FactoryBot.build_list(:address, rand(3) + 1)
      end
      user.phone_numbers << FactoryBot.build(:phone_number)
      user.addresses << FactoryBot.build(:address)
    end
  end

  def build_contact_for(user)
    Contact.new FactoryBot.attributes_for(:contact, user_id: user.id)
  end
end
