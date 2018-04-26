class Book < ApplicationRecord
  belongs_to :author


  scope(:book_title, -> (b_title) { where("LOWER(title) like ?", "%#{b_title.downcase}%") })
  scope(:book_author, -> (b_author) { includes(:author).references(:author).where("LOWER(authors.name) like ?", "%#{b_author.downcase}%") })
  scope(:book_genre, -> (b_genre) { where("LOWER(genre) like ?", "%#{b_genre.downcase}%") })


  scope(:pricefrom, -> (price) { where("price >= ?", price.to_f)})
  scope(:priceto, -> (price) { where("price <= ?", price.to_f)})

end
