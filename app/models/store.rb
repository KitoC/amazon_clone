class Store < ApplicationRecord
  geocoded_by :full_address
  after_validation :geocode
  def full_address
    "#{street}, #{city}, #{state}, #{postcode}"
  end
end
