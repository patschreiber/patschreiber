# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby version required.
ruby '2.7.1'

# Rails version required.
gem 'rails', '~> 6.0.3.2'

# Interface to the GraphViz graphing tool.
gem 'ruby-graphviz'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.6', require: false

# Use Puma as the app server
gem 'puma', '~> 4.3.5'

# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.2.1'

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
# Precompile using rake `webpacker:compile` before releases
gem 'webpacker', '~> 5.1.1'

# A simple, fast Mysql library for Ruby, binding to libmysql.
gem 'mysql2'

# Haml (HTML Abstraction Markup Language) is a layer on top of HTML or XML
# that's designed to express the structure of documents in a non-repetitive,
# elegant, and easy way by using indentation rather than closing tags and
# allowing Ruby to be embedded with ease.
gem 'haml'

# Configurable tool for writing clean and consistent HAML. Used in conjunction
# with rubocop.
gem 'haml_lint'

# A fast, safe and extensible Markdown to (X)HTML parser.
gem 'redcarpet'

# Syntax highlighting for code snippets displayed on the front-end
gem 'rouge'

# SitemapGenerator is a framework-agnostic XML Sitemap generator written in Ruby
# with automatic Rails integration. It supports Video, News, Image, Mobile,
# PageMap and Alternate Links sitemap extensions and includes Rake tasks for
# managing your sitemaps, as well as many other great features.
gem 'sitemap_generator', '~>6.1.2'

# Pretty URLs for Rails.
gem 'friendly_id', '~> 5.3.0'

# Adds a content security policy (CSP). This was the de-facto before Rails 6.
# TODO: Consider switching to native?
gem 'secure_headers', '~>6.3.1'

# Whenever is a Ruby gem that provides a clear syntax for writing and deploying
# cron jobs.
gem 'whenever', require: false

# This gem aims at being a simple and reliable solution for controlling external
# programs running in the background on any Ruby / OS combination.
gem 'childprocess'

# TZInfo provides access to time zone data and allows times to be converted
# using time zone rules.
gem 'tzinfo'

#     _    ____ ___
#    / \  |  _ \_ _|
#   / _ \ | |_) | |
#  / ___ \|  __/| |
# /_/   \_\_|  |___|
#
# Gems used with APIs.

# Full-fledged implementation of the GraphQL spec. Includes query parsing,
# static validation, type definition, and query execution.
# gem 'graphql'

# Ruby toolkit for the GitHub API.
# gem 'octokit', '~> 4.0'

# Ruby Client for the Spotify Web API.
# gem 'spotify-client'

#                      _            _   _
#  _ __  _ __ ___   __| |_   _  ___| |_(_) ___  _ __
# | '_ \| '__/ _ \ / _` | | | |/ __| __| |/ _ \| '_ \
# | |_) | | | (_) | (_| | |_| | (__| |_| | (_) | | | |
# | .__/|_|  \___/ \__,_|\__,_|\___|\__|_|\___/|_| |_|
# |_|
#
# Gems that should only be run in a production environment.
group :production do
  # A modern web server and application server for Ruby, Python and Node.js,
  # optimized for performance, low memory usage and ease of use.
  gem 'passenger', '~> 6.0.5'
end

#      _                _                                  _
#   __| | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_
#  / _` |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
# | (_| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_
#  \__,_|\___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
#                              |_|
#
# Gems that should only be run in the development/test environments.
group :development, :test do

  # Provides a better error page for Rails and other Rack apps. Includes source
  # code inspection, a live REPL and local/instance variable inspection for all
  # stack frames.
  gem 'better_errors', '~> 2.7.1'

  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.10.0'

  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem 'web-console', '>= 4.0.3'

  # RuboCop is a Ruby static code analyzer and code formatter. Out of the box it
  # will enforce many of the guidelines outlined in the community Ruby Style
  # Guide.
  gem 'rubocop', '~> 0.86.0', require: false

  # Automatic Rails code style checking tool. A RuboCop extension focused on
  # enforcing Rails best practices and coding conventions.
  gem 'rubocop-rails', require: false

  # A collection of RuboCop cops to check for performance optimizations in Ruby
  # code.
  gem 'rubocop-performance', require: false

  # Fast, accurate ctags generator for ruby source code using Ripper.
  gem 'ripper-tags'

  # Byebug is a Ruby debugger. It's implemented using the TracePoint C API for
  # execution control and the Debug Inspector C API for call stack navigation.
  # The core component provides support that front-ends can build on. It
  # provides breakpoint handling and bindings for stack frames among other
  # things and it comes with an easy to use command line interface.
  gem 'byebug', '~> 11.1.3'

  # Add a comment summarizing the current schema to the top or bottom of each of
  #   - ActiveRecord models
  #   - Fixture files
  #   - Tests and Specs
  #   - Object Daddy exemplars
  #   - Machinist blueprints
  #   - Fabrication fabricators
  #   - Thoughtbot's factory_bot factories, i.e. the
  #     (spec|test)/factories/<model>_factory.rb files routes.rb file (for Rails
  #     projects).
  gem 'annotate'

  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring.
  gem 'spring'

  # This gem makes Spring watch the filesystem for changes using Listen rather
  # than by polling the filesystem. # On larger projects this means spring will
  # be more responsive, more accurate and use less cpu on local filesystems.
  # (NFS, # shared VM folders and user file systems will still need polling)
  gem 'spring-watcher-listen', '~> 2.0.1'

  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 1.1.0', require: false

  # Solargraph provides a comprehensive suite of tools for Ruby programming:
  # intellisense, diagnostics, inline documentation, and type checking.
  # IDE tools for code completion, inline documentation, and static analysis
  gem 'solargraph', '~> 0.39.8'
end

#  _            _
# | |_ ___  ___| |_
# | __/ _ \/ __| __|
# | ||  __/\__ \ |_
#  \__\___||___/\__|
#
# Gems that should only be run in the test environments.
group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.33.0'

  # WebDriver is a tool for writing automated tests of websites. It aims to
  # mimic the behaviour of a real user, and as such interacts with the HTML of
  # the application.
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'

  # This gem can compare doms and assert certain elements exists in doms using
  # Nokogiri.
  gem 'rails-dom-testing', '~> 2.0', '>= 2.0.3'
end
