# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Seeding the database..."

# Resets the seeds for static tables

Project.delete_all
Blog.delete_all


lambda {
  incense = Project.new
  incense.title = 'Incense'
  incense.slug = 'Incense keeps track of perishable foods in your fridge (or cabinet, or kitchen) and alerts you when something is about to spoil. Never waste food or money again.'
  incense.technologies = 'Ruby on Rails 4, MySQL, HTML, CSS, jQuery, redis, Resque, cron'
  incense.url = 'http://labs.nori.nu/'
  incense.repo_url = 'https://github.com/patschreiber/incense'
  incense.start_date = '2014-01-20'
  incense.end_date = nil
  incense.save!
}.call

lambda {
  nori = Project.new
  nori.title = 'Nori'
  nori.slug = 'Nori is a game about collecting, trading, and improving. Collect items. Play with your friends. Trade around the world.'
  nori.technologies = 'Ruby on Rails 4, MySQL, Capistrano, HTML, CSS, jQuery, redis, Resque, cron'
  nori.url = 'http://nori.nu/'
  nori.repo_url = 'https://github.com/patschreiber/nori.nu'
  nori.start_date = '2013-07-30'
  nori.end_date = nil
  nori.save!
}.call

lambda {
  oilman = Project.new
  oilman.title = 'Oilman'
  oilman.slug = 'Compulsive clicking game. The project stipulations were to make a game over a long holiday weekend. Constraints included feature management due to time as well as quick prototyping and execution'
  oilman.technologies = 'HTML, CSS, jQuery'
  oilman.expanded_info = <<-END
  > Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  > Lorem Ipsum is simply dummy text of the printing anith desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
  >
  > Yes sir thats the desc
  END
  oilman.url = 'http://oilman.labs.nori.nu/'
  oilman.repo_url = 'https://github.com/patschreiber/oilman/'
  oilman.start_date = '2013-12-01'
  oilman.end_date = '2013-12-02'
  oilman.save!  
}.call

lambda {
  cta = Project.new
  cta.title = 'CTA Tracker'
  cta.slug = 'A little project I whipped up to work with graph APIs as well as searching through lists to access specific information. A user clicks all of the stops on the Chicago train line system they have been to and the program tells them information about their time riding the rails.'
  cta.technologies = 'HTML, CSS, jQuery, Chart.js'
  cta.url = 'http://cta.labs.nori.nu/'
  cta.repo_url = 'https://github.com/patschreiber/cta'
  cta.start_date = Date.new( 2014, 3, 4 )
  cta.end_date = Date.new( 2014, 4, 16 )
  cta.save!
}.call


lambda {
  blog = Blog.new
  blog.title = '...and we\'re live!'
  blog.post = <<-END 
  > So the site is now live. Deploying with Rails, coupled with Phusion Passenger couldn't have been easier. In the near future I'd like to implement a deploy script with Capistrano, but as it stands I just "flipped the switch" so to speak in the server's config script. Regardless of future plans, the end results is the site is now up and running in production mode!
  >
  > What you're reading right now will serve as the blog post section of the site that houses my ruminations on technology, life, or pretty much anything else. Hopefully you'll get something worthwhile out of it and enjoy reading the posts as much as I enjoy writing them.
  > 
  > On the left , you'll be able to browse the various sections of my site, see what I'm currently tinering on, and contact me if you're feeling chatty. For now, just poke around the site and see if anything strikes your fancy. If you're on mobile, or just want distraction-free reading, tap or click the mobile icon that's just to the right of the header column, near the top of your screen.
  > 
  >
  > Thanks for visiting,
  > 
  > -Pat
  END
  blog.save!
}.call


puts "Finished seeding the database!"