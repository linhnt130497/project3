source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails"
gem "mysql2"
gem "puma"
gem "sass-rails"
gem "uglifier"
gem "jbuilder"
gem "config"
gem "dotenv-rails"
gem "bcrypt"
gem "bootstrap-sass"
gem "i18n-js"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "kaminari"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
  gem "ffaker"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "spring"
end
