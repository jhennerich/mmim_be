# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserMeeting.destroy_all
Meeting.destroy_all
User.destroy_all
User.destroy_all

user_1 = User.create(name: 'Max', email: 'max@test.com', address: '963 test dr')
user_2 = User.create(name: 'John', email: 'john@test.com', address: '852 test rd')
user_3 = User.create(name: 'Oscar', email: 'oscar@test.com', address: '741 test way')
user_4 = User.create(name: 'Kim', email: 'kim@test.com', address: '951 test circle')

meeting_1 = Meeting.create(location_name: "A great place", location_address: "123 test way",
host_name: "john", guest_name: "max")
meeting_2 = Meeting.create(location_name: "A bad place", location_address: "234 test blvd",
host_name: "john", guest_name: "max")
meeting_3 = Meeting.create(location_name: "A terrible place", location_address: "345 test st",
host_name: "john", guest_name: "max")
meeting_4 = Meeting.create(location_name: "A good place", location_address: "456 test place",
host_name: "john", guest_name: "max")
meeting_5 = Meeting.create(location_name: "An OK place", location_address: "567 test dr",
host_name: "john", guest_name: "max")

user_meeting_1 = UserMeeting.create(user_id: user_1.id, meeting_id: meeting_1.id)
user_meeting_2 = UserMeeting.create(user_id: user_1.id, meeting_id: meeting_2.id)
user_meeting_3 = UserMeeting.create(user_id: user_1.id, meeting_id: meeting_3.id)
user_meeting_4 = UserMeeting.create(user_id: user_1.id, meeting_id: meeting_4.id)
user_meeting_5 = UserMeeting.create(user_id: user_1.id, meeting_id: meeting_5.id)

# the following two users are for-front end testing purposes please don't delete
User.create(name: 'usersearch base', email: 'user_search@email.com', address: '2001 Colorado Blvd, Denver, CO 80205')
User.create(name: 'noadd user', email: 'no_add@email.com', address: nil)

host = User.create(name: 'john', email: 'john@email.com')
guest = User.create(name: 'max', email: 'max@email.com')
john_meeting = Meeting.create(location_name: "John's House",
      location_address: "1583 Newton St. Denver CO",
      host_name: "john",
      guest_name: "max"
    )
