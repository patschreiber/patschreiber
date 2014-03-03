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


lambda {
  incense = Project.new
  incense.title = 'Incense'
  incense.slug = 'Incense keeps track of perishable foods in your fridge (or cabinet, or kitchen) and alerts you when something is about to spoil. Never waste food or money again.'
  incense.url = 'http://labs.nori.nu/'
  incense.repo_url = 'https://github.com/patschreiber/incense'
  incense.start_date = '2014-01-20'
  incense.end_date = nil
}.call

lambda {
  nori = Project.new
  nori.title = 'Nori'
  nori.slug = 'Nori is a game about collecting, trading, and improving. Collect items. Play with your friends. Trade around the world.'
  nori.url = 'http://nori.nu/'
  nori.repo_url = 'https://github.com/patschreiber/nori.nu'
  nori.start_date = '2013-07-30'
  nori.end_date = nil
}.call

lambda {
  oilman = Project.new
  title = 'Oilman'
  slug = 'Compulsive clicking game. The project stipulations were to make a game over a long holiday weekend. Constraints included feature management due to time as well as quick prototyping and execution'
  url = nil
  repo_url = 'https://github.com/patschreiber/oilman/'
  start_date = '2013-12-01'
  end_date = '2013-12-02'
}.call


puts "Finished seeding the database!"