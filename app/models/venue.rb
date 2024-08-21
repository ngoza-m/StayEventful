class Venue < ApplicationRecord
  belongs_to :user
  # validates :name, :address, :city, :country, :price, presence: true
  # validates :price, numericality: { greater_than_or_equal_to: 0 }
end
