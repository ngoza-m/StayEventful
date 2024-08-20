class AddColumnToVenues < ActiveRecord::Migration[7.1]
  def change
    add_column :venues, :city, :string
    add_column :venues, :country, :string
  end
end
