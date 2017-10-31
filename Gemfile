source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
ruby '2.3.5'

gem 'administrate'
gem 'bootstrap-sass'
gem 'bourbon'
gem 'coffee-rails', '~> 4.2'
gem 'def_retry', git: 'https://github.com/DiegoSalazar/DefRetry.git'
gem 'devise'
gem 'devise_invitable'
gem 'google-cloud-speech'
gem 'high_voltage'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg'
gem 'pg_search'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'slim-rails'
gem 'turbolinks', '~> 5'
gem 'twilio-ruby'
gem 'tzinfo-data'
gem 'uglifier', '>= 1.3.0'
gem 'activerecord-import'
gem 'airbrake'
gem 'newrelic_rpm'

# so I can create data on heroku to test with
gem 'faker'
gem 'factory_bot_rails'

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate', require: false
  gem 'better_errors'
  gem 'foreman'
  gem 'hub', :require=>nil
  gem 'rails_layout'
  gem 'spring-commands-rspec'
  gem 'bootstrap-generators'
end

group :development, :test do
  gem 'byebug'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'dotenv-rails'
end
group :test do
  gem 'database_cleaner'
  gem 'launchy'
end
