source 'https://rubygems.org'

ruby '2.2.3'
gem 'rails', '4.2.4'

gem 'puma'

# DATABASE
gem 'pg', group: :production
gem 'mysql2', '~> 0.3.20', group: :development

# FRONT-END
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'tinymce-rails'
gem 'tinymce-rails-langs'
gem 'kaminari'

# PRODUCTIVITY
gem 'simple_form', '3.2.0'
gem 'start', '0.1.1'
gem 'responders', '2.1.1'
gem 'enumerate_it', '1.2'
gem 'ratyrate'
gem 'friendly_id', '5.1.0'
gem 'rename'

# UPLOAD
gem 'carrierwave', '0.10.0'
gem 'fog', '1.34'
gem 'net-ssh', '~> 3.0', '>= 3.0.1'
gem 'mini_magick', '4.2.7'

# AUTHENTICATION AND AUTHORIZATION
gem 'devise', '3.5.3'
gem 'pundit', '1.0'

group :development, :test do
  gem 'byebug'
  gem 'quiet_assets', '1.1.0'
  gem 'rubocop', require: false
  gem 'brakeman', require: false
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'database_cleaner', '~> 1.4.1'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'rspec-rails', '~> 3.2.1'
  gem 'capybara', '~> 2.4.4'
  gem 'factory_girl_rails', '~> 4.5.0'
end

gem 'rails_12factor', group: :production
