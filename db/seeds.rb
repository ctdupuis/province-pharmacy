# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    { username: 'ctd', password: ENV['PASS'], first_name: 'cody', last_name: 'dupuis', admin: true },
    { username: 'mp', password: ENV['PASS'], first_name: 'mona', last_name: 'patel', admin: true },
    { username: 'amv', password: ENV['PASS'], first_name: 'Angelle', last_name: 'Voinche', admin: true },
    { username: 'td', password: ENV['PASS'], first_name: 'Thuy', last_name: 'dang', admin: true },
    { username: 'ess', password: ENV['PASS'], first_name: 'evan', last_name: 'st. Germain' },
    { username: 'bcs', password: ENV['PASS'], first_name: 'Brittany', last_name: 'Sanders'}
]

# { username: 'tk', password: ENV['PASS'], first_name: 'Rollentrea', last_name: 'Kree'}
# { username: 'cbs', password: ENV['PASS'], first_name: 'Cicely', last_name: 'Scarlet'}
#  { username: 't', password: ENV['PASS'], first_name: 'Taylor', last_name: 'IDFK'}
users.each{ |user| User.create(user) }

Post.create(content: 'Welcome to the Province Employee Portal!', user_id: 1)
Post.create(content: "No one gets off days anymore, I'm sick of being short-handed. Cody forgot to lock the shutter and Evan always has some kind of smart ass comment to make about everything.", user_id: 2