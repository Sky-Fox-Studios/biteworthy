source 'https://rubygems.org'
gem 'rake', '11.3.0'
gem 'rails', '4.2.5'                         # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'devise'                                 # User authentication
gem 'cancan'                                 # Groups and roles for Devise
gem 'kaminari'                               # Model pagination

gem 'mysql2', '~> 0.3.20'
gem 'figaro'
gem "paperclip", "~> 4.3"
gem "fog"

#Search
gem "progress_bar"
gem "sunspot_rails", "2.2.4"
gem "sunspot_solr", "2.2.7"

#Error reporting
gem 'honeybadger', '~> 3.1'

#Magical additions
gem 'jquery-rails'                           # Use jquery as the JavaScript library
gem 'turbolinks'                             # Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'jbuilder',   '~> 2.0'                     # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder

# gem 'spring',        group: :development     # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'foundation-rails', '6.2.4.0'
gem 'aws-sdk'                                # Amazon Cloud Storage: S3
gem 'simple_form'
gem 'jquery-datatables-rails', '~> 3.3.0'
# Form handlers
gem 'foundation-icons-sass-rails'            # More Icons!
gem 'compass-rails'                          # you need this or you get an err
gem 'sass-rails', '~> 5.0'                   # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'                   # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'               # Use CoffeeScript for .js.coffee assets and views
gem "font-awesome-rails"
gem 'sprockets'
gem 'holidays'
# gem 'acts_as_paranoid'
gem 'faker'                                  # Creating fake seed data
gem 'draper'                                 # Moving View logic out

group :development do
  gem "capistrano", "~> 3.8.1", require: false
  gem 'capistrano-rvm'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'capistrano-rails', '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
  gem 'capistrano-passenger', '~> 0.0.5'
end

group :development, :test do
  gem 'rspec-rails', '>= 3.0.0.beta'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'meta_request'                      # Chrome inspector to view Rails load times
  gem 'pry'
end
