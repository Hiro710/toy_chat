source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "4.0.9"

gem "rails", "~> 8.1.4"

# Use Propshaft as the asset pipeline
gem "propshaft"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Dart Sass to process CSS
gem "dartsass-rails"

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]

  # RSpecを追加
  gem "rspec-rails"

  # テスト用モデルデータを作成するためにfactory_botを追加
  gem "factory_bot_rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem 'rails-i18n', '~> 8.0'

gem "bulma-rails", "~> 1.0"

# Use postgresql as the database for Active Record (all environments)
gem "pg", "~> 1.1"
