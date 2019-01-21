# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'seeding'

for i in User.first.id..User.last.id do
	Post.create(title: 'Aliens have been sent by Jesus', body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: i, created_at: Time.now, updated_at: Time.now)
	Post.create(title: 'Aliens have been sent by Jesus', body: "UFO (ang. unidentified flying object, UFO), in. niezidentyfikowany obiekt latający (NOL) – wywodzące się z nazewnictwa wojskowego United States Air Force określenie obiektu latającego (statku powietrznego) niedającego się zidentyfikować jako żaden znany pojazd ani wyjaśnić żadnym ze znanych zjawisk atmosferycznych. W okresie zimnej wojny utrwaliło się błędne (niezidentyfikowany nie musi oznaczać pozaziemski) potoczne znaczenie UFO jako pojazdu cywilizacji pozaziemskiej (latającego spodka).", user_id: i, created_at: Time.now, updated_at: Time.now)
	Post.create(title: 'Aliens are cool...', body: "So cool you won't believe how cool they are,
	whlist, read about UFO in Afrikaans:,
	Die term Vreemde vlieënde voorwerp (VVV) is 'n direkte vertaling van die Engelse unidentified flying object (UFO) en verwys na elke vlieënde of skynbaar vlieënde voorwerp of fenomeen wat in die lug of aan die hemel waargeneem word en wat vanweë sy kenmerke vir mense wat dit raaksien raaiselagtig blyk te wees. Die term word in die omgangstaal net soos vlieënde piering dikwels as 'n sinoniem vir ruimtevaartuie van moontlik buiteaardse oorsprong gebruik, alhoewel hierdie definisie tot dusver nog op suiwer spekulasie berus. ", user_id: i, created_at: Time.now, updated_at: Time.now)
	Post.create(title: 'Are you a believer?', body: "Take care of your eternal probing privilege today!", user_id: i, created_at: Time.now, updated_at: Time.now)
	Post.create(title: 'Aliens have arrived', body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod", user_id: i, created_at: Time.now, updated_at: Time.now)
end