source 'http://rubygems.org'

gem 'rails', '3.0.9'

gem 'pg'
gem 'haml'
gem 'sass'
gem 'httparty'
gem 'delayed_job'
gem 'delayed_job_active_record'
gem 'nokogiri'
# according to the docs, we should use this version of dragonfly.  refinery is using an older version.
gem 'dragonfly', '~>0.9.10'
gem 'rack-cache', :require => 'rack/cache'

gem 'refinerycms'
gem 'jquery-rails', '>= 1.0.12'

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

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  # gem 'webrat'
   gem 'mongrel', '>= 1.2.0.pre2'
end

# CUSTOM ENGINES:
gem 'refinerycms-members', '1.0', :path => 'vendor/engines'
gem 'refinerycms-labels', '1.0', :path => 'vendor/engines'
gem 'refinerycms-events', '1.0', :path => 'vendor/engines'
