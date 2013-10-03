ruby '1.9.3'
source 'http://rubygems.org'

gem 'rails', '~> 3.2'

gem 'haml'
gem 'pg'
gem 'thin'
gem 'paranoia'
gem 'delayed_job_active_record'

group :assets do
  gem 'sass-rails',  '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'compass-rails'
  gem 'compass-photoshop-drop-shadow'
  gem 'uglifier'
  gem 'bootstrap-sass-rails-rtl', :git => 'git://github.com/TheGiftsProject/bootstrap-sass-rails-rtl.git', :branch => 'all_fixes'
end

gem 'enumify'
gem 'jquery-rails'
gem 'bcrypt-ruby', :require => 'bcrypt'

group :development, :test do
  gem 'debugger', :platforms => :ruby # excluding this gem from windows environment as it causes issues
  gem 'rspec-rails'
  gem 'awesome_print'
  gem 'quiet_assets'
end

group :development do
  gem 'rails_email_preview'
end