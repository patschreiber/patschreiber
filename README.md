patschreiber
============

Homepage for Pat Schreiber.

## Local Env Bootstrap
1. RVM install
   1. `rvm install ruby 2.6.5`
   2. `rvm gemset create patschreiber`
2. bundle install
   1. `cd /path/to/patschreiber_root/ && bundle install`
3. rvm


# Maintenance
1. Check outdated packages
2. Check SSL Cert
3. Update gems
   -  `bundle outdated`
   -  Update a single gem
      `bundle update <package>`
   -  Update a specific group of gems
      `bundle update --group=GROUP_NAME`
   -  Update all gems
      `bundle update --all`
4. Update Rails
5. Generate sitemaps
   -  Generate sitemaps and ping search engines
      -  `rake sitemap:refresh`
    - Generate sitemaps but don't ping search engines
      - `rake sitemap:refresh:no_ping`
6. Regenerate pretty URLs (friendly_ids)

## Release to production

### Prepare for prod

#### Caches

Clear tmp dirs
`rake tmp:clear`

Creates tmp directories for cache, sockets, and pids
`rake tmp:create`

#### Precomile Assets
1. Clean old compiled webpacks
  - `rake webpacker:clean`
2. Compile JavaScript packs using webpack for production with digests
  - `rake webpacker:compile`

#### Prepare database
2. Creates a db/schema.rb file that is portable against any DB supported by Active Record
  - `rake db:schema:dump`
3. Retrieves the current schema version number
  - `rake db:version`


### Apply to Prod
All commands should be run on the prod server(s).

#### Database

1. Recreates the database from the schema.rb file.
   1. `rake db:schema:load`
2. Set the current RAILS_ENV environment in the ar_internal_metadata table. (Used as part of the protected environment check.)
   1. `rake db:environment:set`
3. Checks if a destructive action can be performed in the current RAILS_ENV environment. Used internally when running a destructive action such as db:drop or db:schema:load.
   1. `rake db:check_protected_environments`

#### Sitemaps
1. Generate sitemaps and ping search engines
   1. `rake sitemap:refresh`
2. Delete all Sitemap files in public/ directory
   1. `rake sitemap:clean`


## Feature Docs

### Gem Updates
**Note** Be aware of gems that are installed outside of bundler. e.g. `gem
install bundler -v 1.17.2`

See which gems are outdated
`bundle outdated`

Update a single gem
`bundle update <package>`

Update a specific group of gems
`bundle update --group=GROUP_NAME`

Update all gems
`bundle update --all`

## Sitemap Regeneration

Create or rebuild your sitemap files as needed. Sitemaps are generated into the public/ folder and by default are named sitemap.xml.gz, sitemap1.xml.gz, sitemap2.xml.gz, etc. As you can see, they are automatically GZip compressed for you. In this case, sitemap.xml.gz is your sitemap "index" file.
`rake sitemap:refresh`

Generate sitemaps but don't ping search engines
`rake sitemap:refresh:no_ping`



### Whenever (Cron)
Cron is run through the `whenever` gem and configured in `config/schedule.rb`.
Cron log is assumed to be `/var/log/cron.log`. See [https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log](https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log) for more info.

Writes the crontab file for your jobs
`whenever --update-crontab`


### Keys and Secrets
Edit Keys
`EDITOR=vim rails credentials:edit`
Use a key
`Rails.application.credentials.secret_key_base`


### Pretty URLs
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

## Secure Headers
Regenerate hashes
`rake secure_headers:generate_hashes`

## Frontend

### Webpack

Run Webpack
`./bin/webpack-dev-server`
Init Webpack
`bundle exec rails webpacker:install`
