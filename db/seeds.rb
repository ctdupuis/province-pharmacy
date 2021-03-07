
users = [
    { username: 'ctd', password: ENV['PASS'], first_name: 'Cody', last_name: 'Dupuis', admin: true },
    { username: 'mp', password: ENV['PASS'], first_name: 'Mona', last_name: 'Patel', admin: true },
    { username: 'amv', password: ENV['PASS'], first_name: 'Angelle', last_name: 'Voinche', admin: true },
    { username: 'ess', password: ENV['PASS'], first_name: 'Evan', last_name: 'St. Germain' },
    { username: 'pm', password: ENV['PASS'], first_name: 'Paisley', last_name: 'Mouton' },
    { username: 'bcs', password: ENV['PASS'], first_name: 'Brittany', last_name: 'Sanders'},
    { username: 'ld', password: ENV['PASS'], first_name: 'Lacey', last_name: 'Dooley'}
]

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

sample = User.demo_accounts.sample
Post.create(content: "This post should only be available in demo mode", user_id: sample.id)
Post.create(content: "Same goes for this one", user_id: sample.id)

Comment.create(content: "I really hope we actually use this.", user_id: 1, post_id: 1)
Comment.create(content: "It was locked I twisted it barehanded dude you were right there", user_id: 1, post_id: 2)
Comment.create(content: "I must have loosened it for you", user_id: 4, post_id: 2)

DeliveryLog.create(demo: true)
DeliveryLog.create(demo: false)

DeliveryEntry.create(
    delivery_log_id: 1,
    patient_name: "Peter Parker",
    patient_address: "20 Ingram St",
    miles: 2.5,
    user_id: 1
)
DeliveryEntry.create(
    delivery_log_id: 2,
    patient_name: "Joseph Joestar",
    patient_address: "69 Hamon Overdrive",
    miles: 4.9,
    user_id: 10
)
DeliveryEntry.create(
    delivery_log_id: 2,
    patient_name: "Eren Jaegar",
    patient_address: "13 Marley Circle",
    miles: 1.7,
    user_id: 10
)
DeliveryEntry.create(
    delivery_log_id: 2,
    patient_name: "Miles Morales",
    patient_address: "5544 Brooklyn Visions Ave",
    miles: 3.4,
    user_id: 10
)

CheckLog.create(demo: true)
CheckLog.create(demo: false)

CheckEntry.create(
    patient_name: "Jimmy John",
    rx_num: "212222",
    original_amt: 100,
    adjusted_amt: 25,
    check_log_id: 1
)
CheckEntry.create(
    patient_name: "Al Copeland",
    rx_num: "109876",
    original_amt: 50,
    adjusted_amt: 0,
    check_log_id: 1
)
CheckEntry.create(
    patient_name: "Jersey Mike",
    rx_num: "762773",
    original_amt: 210,
    adjusted_amt: 15,
    check_log_id: 2
)
CheckEntry.create(
    patient_name: "Ronald McDonald",
    rx_num: "321123",
    original_amt: 50,
    adjusted_amt: 35,
    check_log_id: 2
)

Inventory.create(demo: false)
Inventory.create(demo: true)

items = [
    {
        product_name: "Padded Pak",
        unit_of_measurement: "Box of 50",
        quantity: 20,
        category: "Shipping Supplies",
        inventory_id: 1
    },
    {
        product_name: "Medium Box",
        unit_of_measurement: "Box of 10",
        quantity: 10,
        category: "Shipping Supplies",
        inventory_id: 1
    },
    {
        product_name: "Uline Insulated Box",
        unit_of_measurement: "Box of 4",
        quantity: 6,
        category: "Shipping Supplies",
        inventory_id: 1
    },
    {
        product_name: "Swiffer Soap",
        unit_of_measurement: "Box of 24",
        quantity: 2,
        category: "Cleaning Supplies",
        inventory_id: 1
    },
    {
        product_name: "409 Spray Cleaner",
        unit_of_measurement: "20 oz bottle",
        quantity: 3,
        category: "Cleaning Supplies",
        inventory_id: 1
    },

    {
        product_name: "Padded Pak",
        unit_of_measurement: "Box of 50",
        quantity: 20,
        category: "Shipping Supplies",
        inventory_id: 2
    },
    {
        product_name: "Medium Box",
        unit_of_measurement: "Box of 10",
        quantity: 10,
        category: "Shipping Supplies",
        inventory_id: 2
    },
    {
        product_name: "Uline Insulated Box",
        unit_of_measurement: "Box of 4",
        quantity: 6,
        category: "Shipping Supplies",
        inventory_id: 2
    },
    {
        product_name: "Swiffer Soap",
        unit_of_measurement: "Box of 24",
        quantity: 2,
        category: "Cleaning Supplies",
        inventory_id: 2
    },
    {
        product_name: "409 Spray Cleaner",
        unit_of_measurement: "20 oz bottle",
        quantity: 3,
        category: "Cleaning Supplies",
        inventory_id: 2
    }
]

items.each{ |item| Item.create(item) }