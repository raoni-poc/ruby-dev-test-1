source "https://rubygems.org"

gem "rails", "~> 8.0.2"# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "puma", ">= 5.0" # Use the Puma web server [https://github.com/puma/puma]
# gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "bcrypt", "~> 3.1.7"# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "tzinfo-data", platforms: %i[ windows jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "solid_cache" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_queue" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cable" # Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "kamal", require: false # Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "thruster", require: false # Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
# gem "image_processing", "~> 1.2" # Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "rack-cors" # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
group :development, :test do
  gem "faker", "~> 3.5"
  gem "dotenv-rails"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude" # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "brakeman", require: false # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "rubocop-rails-omakase", require: false # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
end
gem "pg", "~> 1.5"
gem "sidekiq", "~> 8.0"
gem "devise", "~> 4.9"
gem "devise-jwt", "~> 0.12.1"
gem "devise_token_auth", "~> 1.2"
gem "rubyzip", "~> 2.4"
gem "pagy", "~> 9.3"
gem "jsonapi-serializer", "~> 2.2"
gem "active_storage_validations", "~> 2.0"
