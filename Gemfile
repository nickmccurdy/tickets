source 'https://rubygems.org'
ruby '2.0.0'

# Important stuff
gem 'rails', '~> 3.2'
gem 'thin', '~> 1.5'

# Database
group :production do
	gem 'pg', '~> 0.14'
end
group :development, :test do
	gem 'sqlite3', '~> 1.3'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
	gem 'sass-rails',   '~> 3.2'
	gem 'bootstrap-sass', '~> 2.2'
	gem 'bootswatch-rails', '~> 0.3'
	gem 'font-awesome-sass-rails', '~> 3.0'
	gem 'coffee-rails', '~> 3.2'
	gem 'uglifier', '~> 1.0'
end

group :test do
	gem 'simplecov', '~> 0.7', require: false
end

group :development do
	gem 'binding_of_caller', '~> 0.6'
	gem 'better_errors', '~> 0.3'
end

gem 'jquery-rails', '~> 2.1'
gem 'browser_details', '~> 0.0'

gem 'yard'
gem 'yard-activerecord'
gem 'redcarpet'
gem 'simple_form'
