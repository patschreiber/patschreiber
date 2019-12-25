patschreiber
============

Homepage for Pat Schreiber.

# Maintenance
1. Check outdated packages
2. Check SSL Cert
3. Update gems
4. Update Rails
5. Regenerate Sitemap
6. Regenerate pretty URLs (friendly_ids)

## Gem Update
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

Output information about each sitemap that is written including its location, how many links it contains, and the size of the file.
`rake sitemap:refresh`

## Cron
Cron is run through the `whenever` gem and configured in `config/schedule.rb`.
Cron log is assumed to be `/var/log/cron.log`. See [https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log](https://askubuntu.com/questions/56683/where-is-the-cron-crontab-log) for more info.

Writes the crontab file for your jobs
`whenever --update-crontab`

## Keys and Secrets

Edit Keys
`EDITOR=vim rails credentials:edit`
Use a key
`Rails.application.credentials.secret_key_base`

## Pretty URLs
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

## Secure Headers
Regenerate hashes
`rake secure_headers:generate_hashes`

Adds the slug column to a database table
`rails g migration AddSlugToUsers slug:uniq`

Run Webpack
`./bin/webpack-dev-server`
