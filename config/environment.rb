# Load the app's custom environment variables here, before environments/*.rb
# app_env_vars = File.join(Rails.root, 'config', 'initializers', 'app_env_vars.rb')
# load(app_env_vars) if File.exists?(app_env_vars)

# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Xander::Application.initialize!
