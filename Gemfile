source 'https://rubygems.org'

gem 'rails', '3.2.15'


# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg'
gem 'oauth', '0.4.7'
gem 'httparty', '0.10.2'
gem 'nokogiri', '1.5.9'
gem 'twilio-ruby', '3.9.0'
gem 'aws-s3', :require => 'aws/s3'

group :development, :test do
  gem 'pry-rails'
  # gem 'pry-debugger'
  # gem 'debugger', '1.6.5'
  gem 'byebug'
  gem 'annotate'
  gem 'rails-footnotes'
  gem 'capybara'
  gem 'factory_girl_rails', '~> 4.0'
end

group :development do
  # Generally keeping these out of test environment because
  # they sporadically cause segmentation fault
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :production do
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass', '~> 3.2.13'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', require: 'bcrypt'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'
#
ruby '2.1.2'
