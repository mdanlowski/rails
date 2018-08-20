# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# some witty lines
Citation.create(citation_text: 'Ayy lmao - ancient alien saying')
Citation.create(citation_text: 'Fear is a mindkiller')
Citation.create(citation_text: 'Pizza is the meaning of life')
Citation.create(citation_text: 'Pyramids were built in COBOL')

# fill up to 20
for i in 1..16
	Citation.create(citation_text: 'seeds, test')
end