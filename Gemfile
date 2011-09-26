require 'rbconfig'
HOST_OS = Config::CONFIG['host_os']
source 'http://rubygems.org'

gem 'rails', '3.1.0'

gem "pg", :group => :production
gem "mysql", :group => :development

gem 'formtastic'
gem 'twilio-ruby'


group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

group :test do  
  gem 'turn', :require => false
end

gem "rspec-rails", ">= 2.6.1", :group => [:development, :test]
gem "factory_girl_rails", ">= 1.2.0", :group => :test
gem "guard", ">= 0.6.2", :group => :development

gem "guard-bundler", ">= 0.1.3", :group => :development
gem "guard-rails", ">= 0.0.3", :group => :development
gem "guard-livereload", ">= 0.3.0", :group => :development
gem "guard-rspec", ">= 0.4.3", :group => :development
gem "devise", "~> 1.4.7"
gem "frontend-helpers"
gem "rails-footnotes", ">= 3.7", :group => :development
gem "twilio-ruby"



