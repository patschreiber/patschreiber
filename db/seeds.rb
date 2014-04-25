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
  blog.title = 'The call of a new venture'
  blog.post = <<-END 
  > First Blog
  > Content Please
  END
  blog.save!
}.call


puts "Finished seeding the database!"