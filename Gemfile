source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'carrierwave'
gem 'rmagick'
# Задеплоить на хероку bundle install --without production
# group :production do
#   gem 'pg'
# end
# heroku apps:create megabbq
# git push heroku master
# heroku run rake db:migrate

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

