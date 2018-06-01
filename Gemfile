source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'

# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# database 
gem 'sqlite3'
gem 'mysql2'
# dump database to yml file
# rails db:data:dump; rails db:data:load
gem 'yaml_db'

# plugins
gem 'psych'
# 語言設定
gem "rails-i18n"

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# ENV 參數管理 at config/application.yml
gem 'figaro'

# 背景執行
# gem 'sidekiq'
# 搭配 sidekiq
# gem 'redis', '~> 3.0'

# soft destroy (保存刪除資料)
gem "paranoia", "~> 2.2"

# 圖片上傳管理
gem 'carrierwave'
gem "mini_magick"
gem 'carrierwave-processing'

# 狀態管理 https://github.com/aasm/aasm
gem 'aasm'

# 分頁 - rails generate kaminari:views bootstrap3
gem 'kaminari'

# 麵包路徑
gem "breadcrumbs_on_rails"
# meta-tags 管理 https://github.com/kpumuk/meta-tags
gem 'meta-tags'

# 標籤tags https://github.com/mbleigh/acts-as-taggable-on 
# rails acts_as_taggable_on_engine:install:migrations
gem 'acts-as-taggable-on', '~> 4.0'


# 紀錄瀏覽數 https://github.com/charlotte-ruby/impressionist
# rails g impressionist; rails db:migrate
gem 'impressionist'

# 紀錄 activerecord 變化 https://github.com/airblade/paper_trail 
# rails generate paper_trail:install; rails db:migrate
gem 'paper_trail'

# 背景 post/get 
# gem "rest-client"

# 排程定時執行
# gem 'whenever', :require => false

# 解析html/xml
gem "nokogiri"

# Email 預覽
gem 'premailer-rails'

# 關聯計數
gem 'counter_culture'

# 多層分類使用 https://github.com/collectiveidea/awesome_nested_set https://ruby-china.org/topics/16020
gem 'awesome_nested_set'

# omniauth 社群
# gem 'omniauth-google-oauth2'
# gem 'omniauth-facebook'
# gem 'omniauth-line'

# css 
# font-awesome (icons)
gem "font-awesome-rails"

# bootstrap
gem 'bootstrap3-rails'



# javascript 
gem 'jquery-rails'
gem 'jquery-ui-rails'
# better select
gem "select2-rails"
# jquery_ujs remote with upload files
gem 'remotipart', '~> 1.3'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  # 
  gem 'annotate'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  # 錯誤通知 https://github.com/smartinez87/exception_notification
  # gem 'exception_notification' 
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
