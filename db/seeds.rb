
users = [
    { username: 'ctd', password: ENV['PASS'], first_name: 'cody', last_name: 'dupuis', admin: true },
    { username: 'mp', password: ENV['PASS'], first_name: 'mona', last_name: 'patel', admin: true },
    { username: 'amv', password: ENV['PASS'], first_name: 'Angelle', last_name: 'Voinche', admin: true },
    { username: 'td', password: ENV['PASS'], first_name: 'Thuy', last_name: 'dang', admin: true },
    { username: 'ess', password: ENV['PASS'], first_name: 'evan', last_name: 'st. Germain' },
    { username: 'bcs', password: ENV['PASS'], first_name: 'Brittany', last_name: 'Sanders'}
]




# { username: 'tk', password: ENV['PASS'], first_name: 'Rollentrea', last_name: 'Kree'}
#  { username: 'lld', password: ENV['PASS'], first_name: 'Lacey', last_name: 'IDFK'}
def make_schedule(user)
    schedule = Schedule.create(user_id: user.id)
    i = 1
    while i < 6 do 
        s = Shift.create(date: "12/#{i}", time: "9-5", schedule: schedule, user: user)
        schedule.shifts << s
        i += 1
    end
    schedule.save
end

users.each do |user|
    u = User.create(user)
    make_schedule(u)
end


Post.create(content: 'Welcome to the Province Employee Portal!', user_id: 1)
Post.create(content: "No one gets off days anymore, I'm sick of being short-handed. Cody forgot to lock the shutter and Evan always has some kind of smart ass comment to make about everything.", user_id: 2)

Comment.create(content: "I really hope we actually use this.", user_id: 1, post_id: 1)
Comment.create(content: "It was locked I twisted it barehanded dude you were right there", user_id: 1, post_id: 2)
Comment.create(content: "I must have loosened it for you", user_id: 4, post_id: 2)