# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

Venue.destroy_all

puts "clearing junk"

10.times do
    Venue.create(name: Faker::Fantasy::Tolkien.location, description: Faker::Fantasy::Tolkien.poem, address: Faker::Address.full_address, price: Faker::Number.decimal_part(digits: 2), image_url: "https://images.pexels.com/photos/1428348/pexels-photo-1428348.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
    puts "did it!"
end