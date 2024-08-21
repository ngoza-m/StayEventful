class Venue < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 200 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
