# patschreiber

Homepage for Pat Schreiber.

Current Project Dependency | Version
---------|----------
 Ruby | `2.7.x`
 Rails | `6.x`

## 1. Local Env Bootstrap

### 1.1 First-time Setup

```sh
cd /path/to/project/root
```

#### 1.1.a RVM (Ruby Version Manager)

RVM is a handy way to manage multiple ruby installations on a single host, say,
if said host is running multiple applications that require different Ruby
versions. It's also handy for testing new language releases. An optional
install, but _highly_ suggested.

#### 1.1.b Installing RVM and Project Gemset

```sh
# Update RVM
rvm get head

# Install latest project ruby version
# rvm install ruby-major.minor.revision
# E.g.
rvm install 2.7.1

# Create a gemset for this project
rvm create gemset patschreiber
```

**Note:**
The ruby version and RVM wrapper should switch to the correct versions (if
they're installed) automatically based on the `ruby-version` and `.ruby-gemset`
files located at the root of the project. If they do not, run `rvm use
2.7.1@patschreiber` to manually switch.

#### 1.1.c Installing Dependencies

```shell
# Installs Ruby Gems
bundle install
# Initializes the database
rake db:setup
# Alternatively, if the db is alreay created, you can run
rake db:migrate
rake db:seed

# Install the Rails Webpack helper
rake webpacker:install
rake webpacker:compile
```

##### 1.1.d MacOS-only

Install automatic cert updating

1. `rvm osx-ssl-certs cron install`

See [Troubleshooting: MacOS](#)

## 2. Continued Development

If you're returning to the project, follow these steps.

```sh
cd /path/to/project/root
bundle update
bundle install
rvm get head

# Verifies if Node.js is installed
rake webpacker:check_node
# Verifies if Yarn is installed
rake webpacker:check_yarn
# Verifies that webpack & webpack-dev-server are present
rake webpacker:check_binstubs
# Verifies if Webpacker is installed
rake webpacker:verify_install

webpacker:clean
webpacker:install
webpacker:binstubs
webpacker:compile

rake db:migrate
rake db:schema:load
```

## 2. Linters

### 2.1 Rubocop

1. Auto generates HAML rubocop suggestions
      - `haml-lint --auto-gen-config`
1. Generate warnings for Ruby code
      - `bundle exec rubocop`

#### 2.1.a Auto-fixing Rubocop infractions

To have Rubocop auto-fix a single rule, you can run:

```sh
rubocop --auto-correct --only Style/FrozenStringLiteralComment
```

where the name of the rule is defined in `.rubocop.yml`.

## 3. Maintenance

### 3.1 Tasks

-[] Update outdated packages
-[] Check SSL Cert


### 3.2 Set Default Gemset

`rvm default <ruby version>@<gemset>`

e.g. `rvm default 2.7.1@patschreiber`

```sh
cd /path/to/project/root
rvm get head
```

#### 3.2.a If the Ruby Version Has Changed

Migrate using the RVM syntax:

rvm migrate **old ruby version (source) ruby version (destination)**`

E.g.

```sh
rvm migrate 2.6.5 2.7.1
```

### 3.2 Update Gem Dependencies With Bundler

- Get a list of outdated gems.
  `bundle outdated`
- Update a single gem.
  `bundle update <package>`
- Update a specific group of gems.
  `bundle update --group=GROUP_NAME`
- Update all gems.
  `bundle update --all`

### 3.3 Update Sitemaps

Create or rebuild your sitemap files as needed. Sitemaps are generated into the public/ folder and by default are named sitemap.xml.gz, sitemap1.xml.gz, sitemap2.xml.gz, etc. As you can see, they are automatically GZip compressed for you. In this case, sitemap.xml.gz is your sitemap "index" file.

1. Clear existing sitemaps
   - Delete all Sitemap files in public/ directory
     - `rake sitemap:clean`

2. Generate sitemaps
   - Generate sitemaps and ping search engines
     - `rake sitemap:refresh`
   - Generate sitemaps but don't ping search engines
     - `rake sitemap:refresh:no_ping`
3. Regenerate pretty URLs (friendly_ids)

## 4 Release to production

**Note**

All commands should be run on the prod server(s).

### 4.1 Clear Caches

1. Clear tmp dirs
     - `rake tmp:clear`

1. Creates tmp directories for cache, sockets, and pids
     - `rake tmp:create`

### 4.2 Precomile Assets

1. Clean old compiled webpacks
   - `rake webpacker:clean`

1. Compile JavaScript packs using webpack for production with digests
   - `rake webpacker:compile`

### 4.3 Prepare database

1. Creates a db/schema.rb file that is portable against any DB supported by Active Record
      - `rake db:schema:dump`

1. Retrieves the current schema version number
      - `rake db:version`

### 4.4 Secure Headers

1. Regenerate hashes
    - `rake secure_headers:generate_hashes`

### 4.5Database

1. Recreates the database from the schema.rb file.
    - `rake db:schema:load`
1. Set the current RAILS_ENV environment in the ar_internal_metadata table. (Used as part of the protected environment check.)
    - `rake db:environment:set`
1. Checks if a destructive action can be performed in the current RAILS_ENV environment. Used internally when running a destructive action such as db:drop or db:schema:load.
    - `rake db:check_protected_environments`

## 4. Feature Docs/Project Info

### 4.1 Gem Updates

**Note** Be aware of gems that are installed outside of bundler. e.g. `gem install bundler -v 1.17.2`

### 4.2 Sitemap Regeneration

Create or rebuild your sitemap files as needed. Sitemaps are generated into the public/ folder and by default are named sitemap.xml.gz, sitemap1.xml.gz, sitemap2.xml.gz, etc. As you can see, they are automatically GZip compressed for you. In this case, sitemap.xml.gz is your sitemap "index" file.

`rake sitemap:refresh`

Generate sitemaps but don't ping search engines

`rake sitemap:refresh:no_ping`

### 4.2 Whenever (Cron)

Cron is run through the `whenever` gem and configured in `config/schedule.rb`.
Cron log is assumed to be `/var/log/cron.log`. See [https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log](https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log) for more info.

Writes the crontab file for your jobs
`whenever --update-crontab`

### 4.3 Keys and Secrets

1. Edit Keys
    - `EDITOR=vim rails credentials:edit`
1. Use a key
    - `Rails.application.credentials.secret_key_base`

### 4.4 Pretty URLs

Add Pretty URLs to already-existing entities
`Project.find_each(&:save)`

"Projects" use the title by default, but you can set your own slug using

```rb
lambda {
  project = Project.new
  project.source_type = 'open'
  project.slug = 'my-long-project-pretty-URL'
  # etc...
}
```

### Adds the slug column to a database table

`rails g migration AddSlugToUsers slug:uniq`

## Frontend

### Webpack

```sh
# Init Webpack
bundle exec rails webpacker:install

# Run Webpack
./bin/webpack-dev-server
```

## Troubleshooting

### 1. MacOS

#### 1.1 Enable auto-libs

Most of the systems ships with a package manager so the `enable` mode is the same as `packages`.
Unfortunately on OSX there is not package manger provided so RVM has to detect one of existing user efforts,
The detection is in order: `homebrew`, `macports`, `smf`, `fink` if none of them are available then RVM will install `macports`.

```sh
rvm autolibs enable
```

You can also optionally enforce a package manager by using one of the following instead of `enable`:

`macports`, `homebrew`, `fink`, `smf` (SM Framework) or `rvm_pkg` (the old `rvm pkg`), like:
   1. `rvm autolibs homebrew`

1. bundle install
   1. `cd /path/to/patschreiber_root/ && bundle install`
2. rvm
   1. `rvm use <ruby version>@<your gemset>`
