source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'pg'
gem 'haml'
gem 'sass'
gem 'httparty'
gem 'nokogiri'
# note1: according to the docs, we should use this version of dragonfly.  refinery is using an older version.
# note2: i *think* that refinerycms is handling this config stuff for us...
# gem 'dragonfly', '~>0.9.10'
# gem 'rack-cache', :require => 'rack/cache'

gem 'fog' # we need it for refinerycms-images
gem 'refinerycms'
gem 'jquery-rails', '>= 1.0.12'
gem 'log_buddy'



group :production do 
  gem 'thin'
end

group :development do
  gem 'rspec-rails','2.6.1'
  gem 'faker'
end

group :test do
  gem 'rspec-rails', '2.6.1'
  gem 'remarkable_activerecord','4.0.0.alpha4'
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails'
end


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  # gem 'webrat'
   gem 'mongrel', '>= 1.2.0.pre2'
end

# ADDITIONAL REFINERY ENGINES:
gem 'refinerycms-inquiries', '~> 1.0.0'

# CUSTOM ENGINES:
gem 'refinerycms-members', '1.0', :path => 'vendor/engines'
gem 'refinerycms-events', '1.0', :path => 'vendor/engines'
