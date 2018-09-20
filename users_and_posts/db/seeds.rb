# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.connection.execute('ALTER TABLE users AUTO_INCREMENT = 1')
# ActiveRecord::Base.connection.execute('ALTER TABLE posts AUTO_INCREMENT = 1')
User.delete_all
Post.delete_all

p 'removed old data'

User.create!([{username: 'Janusz'}])
User.create!([{username: 'Ryszard'}])

Post.create!(authorid: 1, posttitle: 'Żywot Janusza', postbody: 'szedł janusz szoso sucho')
Post.create!(authorid: 2, posttitle: 'Lorem ipsum', postbody: 'dolor sit amet and some boobs')

p 'seeding finished'
