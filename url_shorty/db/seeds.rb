# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Redir.destroy_all
puts 'purge all data done'
Redir.create({from: "google.pl"})
Redir.create({from: "facebook.com"})
Redir.create({from: "letussellyourpersonaldata.net"})
Redir.create({from: "ayy.lmao/not-a-website-prolly"})
puts 'seeds done'