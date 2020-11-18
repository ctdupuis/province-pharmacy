
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
#  { username: 't', password: ENV['PASS'], first_name: 'Lacey', last_name: 'IDFK'}
users.each{ |user| User.create(user) }

Post.create(content: 'Welcome to the Province Employee Portal!', user_id: 1)
Post.create(content: "No one gets off days anymore, I'm sick of being short-handed. Cody forgot to lock the shutter and Evan always has some kind of smart ass comment to make about everything.", user_id: 2)

Comment.create(content: "I really hope we actually use this.", user_id: 1, post_id: 1)
Comment.create(content: "It was locked I twisted it barehanded dude you were right there", user_id: 1, post_id: 2)
Comment.create(content: "I must have loosened it for you", user_id: 4, post_id: 2)