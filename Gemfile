source 'https://rubygems.org'

ruby '2.2.3'

gem 'rails', '4.2.5'
gem 'pg', '~> 0.15'
gem 'devise'
gem 'devise-i18n'
gem 'aasm'
gem 'will_paginate-bootstrap'

#for Heroku
gem 'rails_12factor'

gem 'slim-rails'
gem 'bootstrap-sass', '~> 3.3.5'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'autoprefixer-rails'

gem 'jquery-rails'

group :development, :test do
  gem 'faker'
  gem 'faker-russian'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'thin'
end

group :development do
  gem 'quiet_assets'
  gem 'better_errors'
  gem "binding_of_caller"
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'guard-livereload', require: false
  gem "rack-livereload"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'rspec-rails', '~> 3'
  gem 'rspec-its'
  gem 'shoulda-matchers', require: false
  gem 'database_cleaner'
  gem 'capybara'
end
