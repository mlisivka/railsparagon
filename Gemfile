source 'https://rubygems.org'

ruby '2.4.0'
gem 'rails', '~> 5.0.2'

gem 'puma', '~> 3.0'
gem 'gettext'
gem 'gettext_i18n_rails'
gem 'administrate'
gem 'bourbon'
gem 'paperclip', '~> 4.3.7'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'htmlcompressor'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'

group :production do
  gem 'pg', '~> 0.18.2'
  gem 'rails_12factor', '~> 0.0.2'
end
group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
  gem 'railroady'
end
group :test do
  gem 'rspec-rails'
  gem 'rspec-context-private'
  gem "rails-controller-testing"
  gem 'factory_girl_rails'
end
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
