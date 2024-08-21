class Venue < ApplicationRecord
  belongs_to :user

  # validates :name, :address, :city, :country, :price, presence: true
  # validates :price, numericality: { greater_than_or_equal_to: 0 }
  
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true, length: { minimum: 200 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
