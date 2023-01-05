source ENV['RAILS_ENV'] == 'production' ? 'https://gems.ruby-china.com' : 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

gem 'rails', '~> 5.2.0'

gem 'acts-as-taggable-on', '~> 8.1'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false # reduces boot times through caching
gem 'coffee-rails', '~> 4.2'
gem 'friendly_id', '~> 5.4.0'
gem 'jquery-rails'
gem 'meta-tags', require: 'meta_tags'
gem 'pg'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0'
gem 'sitemap_generator'
gem 'thin'
gem 'turbolinks', '~> 5' # https://github.com/turbolinks/turbolinks
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano-rails', '~> 1.6', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-thin', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
