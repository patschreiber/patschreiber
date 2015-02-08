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
  incense = Project.new
  incense.title = 'Incense'
  incense.slug = 'Incense keeps track of perishable foods in your fridge (or cabinet, or kitchen) and alerts you when something is about to spoil. Never waste food or money again.'
  incense.technologies = 'Ruby on Rails 4, MySQL, HTML, CSS, jQuery, Bootstrap, redis, Resque, cron'
  incense.url = 'http://labs.nori.nu/'
  incense.repo_url = 'https://github.com/patschreiber/incense'
  incense.start_date = Date.new( 2014, 01, 20 )
  incense.end_date = Date.new( 2014, 07, 24 )
  incense.save!
}.call

lambda {
  nori = Project.new
  nori.title = 'Nori'
  nori.slug = 'Nori is a game about collecting, trading, and improving. Collect items. Play with your friends. Trade around the world. '
  nori.technologies = 'Ruby on Rails 4, MySQL, Bootstrap, HTML, CSS, jQuery, redis, Resque, cron'
  nori.expanded_info = <<-END
  The project was interesting as it was my first forray into the world of Rails development. I wanted to create a 'compulsive clicking game' that was infectious to play. It borrowed heavily from Diablo 2 (PC) and Cookie Clicker (Flash, PC, Mac). The objective was to collect the best items in the game, either through hard work or smart trading.
  
  The project itself was a mess. As a 'first' web application project, the codebase left a little to be desired, which is as expected, however, aside from that the feature management was all over the place. I started creating features with no real goal. It was really nose to the grindstone from the beginning. I had an *idea* about what I wanted from the end result, but there was no regard to how features would intelligently interact. This led to a jumbled mess of models and their purpose, unnecessary ajax calls, and overall, really complicated javascript to play with Bootstrap. 
  
  If I were to start the project over, I would plan on setting out the base framework, insofar as to have basic interactions laid out. I would also try to encapsulate each action a little more. Another key place that I would improve upon would be the design. I knew I wanted it "dark," like some of the source material it was referencing, however, there was no direction. If one uses greys upon greys upon greys, their UI is going to be very hard to navigate. What are 'actionable' greys, what are not. What dark color is a 'call to action?' Does it successfully grab the users attention? What about the layouts of the information? It was all thrown together, really. The idea was to iterate and iterate, but the initial complexity added by css override classes were just compounded the larger the project got. 

  Ultimately the skills learned and objectives of the project were rolled into a new project that is structured far better than Nori. RIP."
  END
  nori.url = 'http://nori.nu/'
  nori.repo_url = 'https://github.com/patschreiber/nori.nu'
  nori.start_date = Date.new( 2013, 07, 30 )
  nori.end_date = Date.new( 2014, 05, 23 )
  nori.save!
}.call

lambda {
  oilman = Project.new
  oilman.title = 'Oilman'
  oilman.slug = 'Compulsive clicking game. The project stipulations were to make a game over a long holiday weekend. Constraints included feature management due to time as well as quick prototyping and execution'
  oilman.technologies = 'HTML, CSS, jQuery'
  oilman.expanded_info = <<-END
  I had a lot of fun with Oilman. I was with relatives for a weekend, so I decided to see if I couldn't complete a project within a strict deadline. This deadline was 2 days with limited internet and limited time during the day to code. The product of this 'challenge' is a little game where the player tries to build up their oil empire and ultimately pay back the loan shark, who the player owes money.
  The project is pure HTML, CSS, and jQuery. A lot of the actions in the game are dependent on setInterval, and other javascript event handlers. Unfortunately due to the time constraints, the balance in the game is way off. With a little more time I feel the replayability would be increased tenfold.
  END
  oilman.url = 'http://oilman.labs.nori.nu/'
  oilman.repo_url = 'https://github.com/patschreiber/oilman/'
  oilman.start_date = Date.new( 2013, 12, 01 )
  oilman.end_date = Date.new( 2013, 12, 2 )
  oilman.save!  
}.call

lambda {
  pat = Project.new
  pat.title = "patschreiber (site)"
  pat.slug = "This website! Hope you enjoy reading."
  pat.technologies = 'Ruby on Rails 4, MySQL, HTML, CSS (Sass), jQuery, Markdown'
  pat.expanded_info = <<-END
  This website was lovingly coded by hand to showcase all of my works that, in my opinion, are worth showing off. You're now reading about the website on the website you're reading. We're getting a little meta, but enjoy. 

  I used my goto technology for this website, but I deliberately **_didn't_** use a CSS framework like Bootstrap. I always enjoy tinkering with CSS, which is crazy I know, but getting better making responsive, mobile-friendly sites without the help of a framework is always a good exercise for improvement.
  END
  pat.url = 'http://patschreiber.com'
  pat.repo_url = 'https://github.com/patschreiber/patschreiber'
  pat.start_date = Date.new( 2014, 2, 21 )
  pat.save!
}.call

lambda {
  timeless = Project.new
  timeless.title = 'Timeless Online'
  timeless.slug = 'Timeless is an online game that evolved from my "Nori" project. With programmer experience comes more sophistication in said programmers code, and Timeless represents this notion well.'
  timeless.expanded_info = <<-END
  Timeless is the project that evolved from "Nori." With programmer experience comes more sophistication in said programmers code, and Timeless represents this well. Timeless is another online game, but is currently a lot farther than Nori ever was in a fraction of the time.

  Timeless is a work in progress, but quite a bit of the framework is already in place for a complete game. I'll describe what's currently in place and working for the game.

  Timeless uses a turn-based 'active battle system' for battling monsters. What this means is after a certain amout of time, the player will be able to perform an action, however, the enemy will also be able to complete actions after *their* ATB gauge fills completely.
  The player does all of this monster killing in the hopes of collecting interesting loot that will eventually be able to be traded with others. Each enemy has a designated "area" where it will randomly appear. Each enemy also has a unique loot table that will drop items randomly.
  
  Once an item is dropped, the real fun begins. An item can be randomized, both with it's own stats and with the possibility of having a prefix or suffix added to the item, each with its own stat changes. This adds an immense amount of uniqueness and possible variations in any particular item.
  For instance, lets say we have the following:

  **Hoodie** - Base defense 5-20

  Now this hoodie rolled with 15 defense and can roll with a prefix and a suffix. Let's say we're lucky enough to get both and we get the prefix "Ragged" and the suffix "of the Sun." Let's also say that the "Ragged" prefix give -5 defense, and the "of the Sun" suffix gives +20 health and +3 attack. Our hoodie will now look something like the following:

  **Ragged Hoodie of the Sun** - -10 Defense, +20 Health, +3 attack.

  Each item also has its own unique id, which will help prevent duplicating items (duping) if it ever becomes an issue. Finally, the inventory system is finished at the moment. A player can equip or unequip an item. This action is an AJAX call to the server, which checks to see if a previous item in the "item slot" is equipped, and will unequip the old item and equip the new one. For instance, if we already have a Helmet in the "helm" slot, the system will unequip the old Helmet and equip the new one. 
  END
  timeless.technologies = 'Ruby on Rails 4, MySQL, HTML, CSS, jQuery'
  timeless.url = 'http://timeless.labs.nori.nu/'
  timeless.repo_url = 'https://github.com/patschreiber/timeless_online'
  timeless.start_date = Date.new( 2014, 10, 3 )
  timeless.end_date = nil
  timeless.save!
}.call

lambda {
  blog = Blog.new
  blog.title = '...and we\'re live!'
  blog.post = <<-END 
  So the site is now live. Deploying with Rails, coupled with Phusion Passenger couldn't have been easier. In the near future I'd like to implement a deploy script with Capistrano, but as it stands I just "flipped the switch" so to speak in the server's config script. Regardless of future plans, the end result is the site is now up and running in production mode!
  
  What you're reading right now will serve as the blog post section of the site that houses my ruminations on technology, life, or pretty much anything else. Hopefully you'll get something worthwhile out of it and enjoy reading the posts as much as I enjoy writing them.
  
  On the left , you'll be able to browse the various sections of my site, see what I'm currently tinering on, and contact me if you're feeling chatty. For now, just poke around the site and see if anything strikes your fancy. If you're on mobile, or just want distraction-free reading, tap or click the mobile icon that's just to the right of the header column, near the top of your screen.
  
    Thanks for visiting,
  
  -Pat
  END
  blog.save!
}.call

lambda {
  blog = Blog.new
  blog.title = "Adaptive Interfaces, or, the media queries of the future."
}


puts "Finished seeding the database!"