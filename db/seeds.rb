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
  incense.end_date = '2014-07-24'
  incense.save!
}.call

lambda {
  nori = Project.new
  nori.title = 'Nori'
  nori.slug = 'Nori is a game about collecting, trading, and improving. Collect items. Play with your friends. Trade around the world. '
  nori.technologies = 'Ruby on Rails 4, MySQL, Capistrano, HTML, CSS, jQuery, redis, Resque, cron'
  nori.expanded_info = <<-END
  > The project was interesting as it was my first forray into the world of Rails development. I wanted to create a 'compulsive clicking game' that was infectious to play. It borrowed heavily from Diablo 2 (PC) and Cookie Clicker (Flash, PC, Mac). The objective was to collect the best items in the game, either through hard work or smart trading.
  >
  > The project itself was a mess. As a 'first' web application project, the codebase left a little to be desired, which is as expected, however, aside from that the feature management was all over the place. I started creating features with no real goal. It was really nose to the grindstone from the beginning. I had an *idea* about what I wanted from the end result, but there was no regard to how features would intelligently interact. This led to a jumbled mess of models and their purpose, unnecessary ajax calls, and overall, really complicated javascript to play with Bootstrap. 
  >
  > If I were to start the project over, I would plan on setting out the base framework, insofar as to have basic interactions laid out. I would also try to encapsulate each action a little more. Another key place that I would improve upon would be the design. I knew I wanted it "dark," like some of the source material it was referencing, however, there was no direction. If one uses greys upon greys upon greys, their UI is going to be very hard to navigate. What are 'actionable' greys, what are not. What dark color is a 'call to action?' Does it successfully grab the users attention? What about the layouts of the information? It was all thrown together, really. The idea was to iterate and iterate, but the initial complexity added by css override classes were just compounded the larger the project got. 
  >
  > Ultimately the skills learned and objectives of the project were rolled into a new project that is structured far better than Nori. RIP."
  END
  nori.url = 'http://nori.nu/'
  nori.repo_url = 'https://github.com/patschreiber/nori.nu'
  nori.start_date = '2013-07-30'
  nori.end_date = '2014-05-23'
  nori.save!
}.call

lambda {
  oilman = Project.new
  oilman.title = 'Oilman'
  oilman.slug = 'Compulsive clicking game. The project stipulations were to make a game over a long holiday weekend. Constraints included feature management due to time as well as quick prototyping and execution'
  oilman.technologies = 'HTML, CSS, jQuery'
  oilman.expanded_info = <<-END
  > I had a lot of fun with Oilman. I was with relatives for a weekend, so I decided to see if I couldn't complete a project within a strict deadline. This deadline was 2 days with limited internet and limited time during the day to code. The product of this 'challenge' is a little game where the player tries to build up their oil empire and ultimately pay back the loan shark, who the player owes money.
  > The project is pure HTML, CSS, and jQuery. A lot of the actions in the game are dependent on setInterval, and other javascript event handlers. Unfortunately due to the time constraints, the balance in the game is way off. With a little more time I feel the replayability would be increased tenfold.
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
  > So the site is now live. Deploying with Rails, coupled with Phusion Passenger couldn't have been easier. In the near future I'd like to implement a deploy script with Capistrano, but as it stands I just "flipped the switch" so to speak in the server's config script. Regardless of future plans, the end result is the site is now up and running in production mode!
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

lambda {
  blog = Blog.new
  blog.title = "Adaptive Interfaces, or, the media queries of the future."
}


puts "Finished seeding the database!"