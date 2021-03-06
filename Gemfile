source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use bootstrap 4
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'

# Use font-awesome5
gem 'font-awesome-sass', '~> 5.0.6'

# Use sorcery, Magical Authentication
gem 'sorcery'

# Use i18n
gem 'rails-i18n', '~> 5.1'

# Use draper, View Models for Rails
gem 'draper'

# Use kaminari, for Pagination
gem 'kaminari', '~> 0.17.0'

# User CarrierWave, solution for file uploads for Rails
gem 'carrierwave', '~> 2.0'

# Use ransack, Object-based searching.
gem 'ransack'

# config, Easiest way to add multi-environment yaml settings to Rails
gem 'config'

# A simple wrapper for posting to slack channels
gem 'slack-notifier'

# Exception Notifier Plugin for Rails
gem 'exception_notification'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'gimei'

  # Use pry-byebug, debuging tools
  gem 'pry-byebug'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Letter Opener, A web interface for browsing Ruby on Rails sent emails
  gem 'letter_opener_web', '~> 1.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
