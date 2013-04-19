source 'https://rubygems.org'

gem 'rails', '3.2.12'
#gem 'activesupport', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'less-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'jquery-rails', '2.2.1'
  gem 'jquery-ui-rails','4.0.1'


  gem 'uglifier', '>= 1.0.3'


end

gem 'twitter-bootstrap-rails', '2.2.4'
gem 'bootstrap-datepicker-rails', '1.0.0'
gem 'silk-bootstrap-rails'
gem 'font-awesome-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# Test Driven Development gems
gem "rspec-rails", :group =>[:test,:development]

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry'
end

group :test do
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "faker" # to generate fake names, etc..
  gem "capybara", "1.1.2"
  gem 'poltergeist' #headless webkit/JS testing with capybara
  gem 'pry' # stop tests and pry...

  gem "email_spec"
              #if RUBY_PLATFORM.downcase.include?("darwin")
  gem 'rb-fsevent'
  gem 'guard-spork'
              #gem 'ruby_gntp'
  gem "growl", :git => "https://github.com/visionmedia/growl.git"
  gem "guard-rspec"

  #model testing
  gem 'shoulda-matchers'

  gem 'rspec_junit_formatter'




  #end
end

#paper_trail, for logs
gem 'paper_trail', '~> 2'

#to make diffs of texts, used for logs with paper_trail
gem 'differ'

# for .search and search forms
gem 'ransack', git:'https://github.com/mangelajo/ransack.git'   # ransack 0.7.3 volatilized from rubygems, and tests started failing...

#authentication, etc
gem 'devise'

#authorization
gem 'cancan'

#pagination, etc
gem 'kaminari'

#javascript localization
gem "i18n-js"

#beautiful alerts with bootstrap/javascript
gem 'bootbox-rails'

#build forms easily
gem 'simple_form','2.1.0'
gem 'country_select'

#allow yaml files to be edited online
#gem 'safe_yaml','0.7.1'
gem 'tolk' , :git=>"https://github.com/mangelajo/tolk.git"
gem 'ya2yaml'  # used to export yaml files in urls...

# api documentation
gem 'apipie-rails' , :git=>"https://github.com/mangelajo/apipie-rails.git"

# specific
gem 'github_api'
gem "paperclip", "~> 3.0"
gem 'nokogiri'

