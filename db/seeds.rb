
users = [
    { username: 'ctd', password: ENV['PASS'], first_name: 'cody', last_name: 'dupuis', admin: true },
    { username: 'mp', password: ENV['PASS'], first_name: 'mona', last_name: 'patel', admin: true },
    { username: 'amv', password: ENV['PASS'], first_name: 'Angelle', last_name: 'Voinche', admin: true },
    { username: 'td', password: ENV['PASS'], first_name: 'Thuy', last_name: 'dang', admin: true },
    { username: 'ess', password: ENV['PASS'], first_name: 'evan', last_name: 'st. Germain' },
    { username: 'bcs', password: ENV['PASS'], first_name: 'Brittany', last_name: 'Sanders'}
]




# { username: 'tk', password: ENV['PASS'], first_name: 'Rollentrea', last_name: 'Harp'}
#  { username: 'lld', password: ENV['PASS'], first_name: 'Lacey', last_name: 'IDFK'}
def make_schedule(user)
    if user.demo 
        schedule = Schedule.create(user_id: user.id, demo: true)
    else
        schedule = Schedule.create(user_id: user.id)
    end
    i = 1
    while i < 6 do 
        start = rand(8..10)
        finish = rand(3..5)
        s = Shift.create(date: "12/#{i}", time: "#{start}-#{finish}", schedule: schedule, user: user)
        schedule.shifts << s
        i += 1
    end
    schedule.save
end

users.each do |user|
    u = User.create(user)
    make_schedule(u)
end

def generate_fakes
   10.times do 
        name = Faker::Name.name
        f_name = name.split.first
        l_name = name.split.last
        f_initial = name.split.first.split("").first
        l_initial = name.split.last.split("").first
        u_name = f_initial + l_initial
        user_data = {
            first_name: f_name,
            last_name: l_name,
            username: u_name,
            admin: true,
            password: "demo",
            phone: Faker::PhoneNumber.cell_phone,
            email: Faker::Internet.safe_email(name: f_name),
            demo: true
        }
        fake_user = User.create(user_data)
        make_schedule(fake_user)
   end
end

generate_fakes

Conversation.create(title: "Province Portal")
Conversation.create(title: "Province Portal Demo Mode", demo: true)

Message.create(text: "Greg Monroe updated CC info", conversation_id: 1, user_id: 2)
Message.create(text: "John Doe here to pickup DOB 12/29/90", conversation_id: 1, user_id: 3)
Message.create(text: "Welcome to Patient Services Demo", conversation_id: 2, user_id: 8)

Post.create(content: 'Welcome to the Province Employee Portal!', user_id: 1)
Post.create(content: "No one gets off days anymore, I'm sick of being short-handed. Cody forgot to lock the shutter and Evan always has some kind of smart ass comment to make about everything.", user_id: 2)
Post.create(content: "This post should only be available in demo mode", user_id: 7)
Post.create(content: "Same goes for this one", user_id: 10)

Comment.create(content: "I really hope we actually use this.", user_id: 1, post_id: 1)
Comment.create(content: "It was locked I twisted it barehanded dude you were right there", user_id: 1, post_id: 2)
Comment.create(content: "I must have loosened it for you", user_id: 4, post_id: 2)