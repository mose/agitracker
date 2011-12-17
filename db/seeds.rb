# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '... Creating default pages'
page_home = Page.create([
{ name: 'home',
  title: "Home page",
  content: "This is the homepage, customize it in /admin/page/home/edit"
},
{ name: 'contact',
  title: "Contact us",
  content: "This is the contact page, customize it in /admin/page/contact/edit"
},
{ name: 'help',
  title: "Help and FAQ",
  content: "This is the help page, customize it in /admin/page/help/edit"
},
{ name: 'about',
  title: "About us",
  content: "This is the homepage, customize it in /admin/page/about/edit"
}
])

puts '... Setting up default user login'

user = User.create! :name => 'Admin', :email => 'admin@example.com', :password => 'admin123', :password_confirmation => 'admin123'
user.roles = ['admin']
user.save
puts '... New user created: ' << user.name

user = User.create! :name => 'Editor', :email => 'editor@example.com', :password => 'editor123', :password_confirmation => 'editor123'
user.roles = ['editor']
user.save
puts '... New user created: ' << user.name
