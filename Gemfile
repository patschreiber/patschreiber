source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'

# Haml (HTML Abstraction Markup Language) is a layer on top of HTML or XML
# that's designed to express the structure of documents in a non-repetitive,
# elegant, and easy way by using indentation rather than closing tags and
# allowing Ruby to be embedded with ease.
gem 'haml'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# A modern web server and application server for Ruby, Python and Node.js,
# optimized for performance, low memory usage and ease of use.
gem 'passenger', '~> 6.0.4'

# A simple, fast Mysql library for Ruby, binding to libmysql.
gem 'mysql2'

# A fast, safe and extensible Markdown to (X)HTML parser.
gem 'redcarpet'

# SitemapGenerator is a framework-agnostic XML Sitemap generator written in Ruby
# with automatic Rails integration. It supports Video, News, Image, Mobile,
# PageMap and Alternate Links sitemap extensions and includes Rake tasks for
# managing your sitemaps, as well as many other great features.
gem 'sitemap_generator', '~>6.0.2'

# Pretty URLs for Rails
gem 'friendly_id', '~> 5.3.0'

gem 'secure_headers', '~>6.1.1'

# Whenever is a Ruby gem that provides a clear syntax for writing and deploying
# cron jobs.
gem 'whenever', require: false

# Third party Services
# gem 'google-api-client', '~> 0.36'

group :development, :test do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'annotate'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Flay analyzes code for structural similarities. Differences in literal values, variable, class, method names, whitespace, programming style, braces vs do/end, etc are all ignored.
  gem 'flay'
  gem 'flay-haml'

  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
