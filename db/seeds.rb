# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# the following two users are for-front end testing purposes please don't delete
User.create(name: 'usersearch base', email: 'user_search@email.com', address: '2001 Colorado Blvd, Denver, CO 80205')
User.create(name: 'noadd user', email: 'no_add@email.com', address: nil)
