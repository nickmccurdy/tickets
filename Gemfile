source 'https://rubygems.org'

# Important stuff
gem 'rails', '4.0.1'
gem 'thin'

# Database
group :production do
	gem 'pg'
end
group :development, :test do
	gem 'sqlite3'
end

# Gems used for assets
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'font-awesome-sass-rails'
gem 'uglifier'

group :test do
	gem 'simplecov', require: false
end

group :development do
	gem 'binding_of_caller'
	gem 'better_errors'
end

group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
end

gem 'jquery-rails'
gem 'browser_details'

gem 'yard'
gem 'yard-activerecord'
gem 'redcarpet'
gem 'simple_form', github: 'plataformatec/simple_form'
