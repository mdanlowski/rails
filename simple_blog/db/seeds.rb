# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create(title: 'Aliens have arrived', body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, jaja siedliskiem duszy", user_id: 9, created_at: Time.now, updated_at: Time.now)
Post.create(title: 'Aliens have been sent by Jesus', body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 10, created_at: Time.now, updated_at: Time.now)
Post.create(title: 'Aliens are cool...', body: "So cool you won't believe", user_id: 11, created_at: Time.now, updated_at: Time.now)
Post.create(title: 'Are you a believer?', body: "Take care of your eternal probing privilege today!", user_id: 13, created_at: Time.now, updated_at: Time.now)
Post.create(title: 'Aliens have arrived', body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod", user_id: 12, created_at: Time.now, updated_at: Time.now)
