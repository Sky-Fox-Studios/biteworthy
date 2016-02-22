source 'https://rubygems.org'

group :development do
  gem 'sqlite3'                                # Use sqlite3 as the database for Active Record
end

group :production do
  gem 'pg'
  gem "activerecord-postgresql-adapter"
end

gem 'rails', '4.2.1'                         # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'devise'                                 # User authentication
gem 'cancan'                                 # Groups and roles for Devise
gem 'kaminari'                               # Model pagination

gem 'honeybadger', '~> 2.0'

gem 'jquery-rails'                           # Use jquery as the JavaScript library
gem 'turbolinks'                             # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder', '~> 2.0'                     # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'sdoc', '~> 0.4.0',          group: :doc # bundle exec rake doc:rails generates the API under doc/api.
gem 'spring',        group: :development     # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'foundation-rails', '5.5.2.1'
gem 'aws-sdk'                                # Amazon Cloud Storage: S3
gem 'simple_form'
gem 'jquery-datatables-rails', '~> 3.3.0'
# Form handlers
gem 'foundation-icons-sass-rails'            # More Icons!
gem 'compass-rails'                          # you need this or you get an err
gem 'sass-rails', '>= 4.0.3'                 # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                   # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'               # Use CoffeeScript for .js.coffee assets and views
# gem 'font-awesome-sprockets'
gem "font-awesome-rails"
gem 'sprockets'
# gem 'font-awesome-sass'                      # Sweet Font Icons
# gem "less-rails"                             # dependancy for Font Awesome less
# gem "therubyracer"                            # dependancy for less
gem 'holidays'
# gem 'acts_as_paranoid'
gem 'faker'                                  # Creating fake seed data
gem 'draper'                                 # Moving View logic out

group :development, :test do
  gem 'rspec-rails', '>= 3.0.0.beta'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'meta_request'                      # Chrome inspector to view Rails load times
  gem 'pry'
end



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
