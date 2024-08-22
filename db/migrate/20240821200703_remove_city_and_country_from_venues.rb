class RemoveCityAndCountryFromVenues < ActiveRecord::Migration[7.1]
  def change
    remove_column :venues, :city, :string
    remove_column :venues, :country, :string
  end
end
