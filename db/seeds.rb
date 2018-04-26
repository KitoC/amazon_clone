# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'BOOKS2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Book.new
  # MAKE SURE YOU PLACE THE ID HERE TOO
  t.id = row['id']

  author_check = Author.where({ name: row['author'] })
  t.author = author_check.empty? ? Author.create({ name: row['author'] }) : author_check.first
  t.image = row['image']
  t.title = row['title']
  t.rating = row['rating']
  t.price = row['price']
  t.genre = row['genre']
  t.save

end
puts "There are now #{Book.count} rows in the transactions table"
