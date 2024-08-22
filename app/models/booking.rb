class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  
  validates :date, :hours, presence: true
  validates :hours, numericality: { less_than_or_equal_to: 24 }
end
