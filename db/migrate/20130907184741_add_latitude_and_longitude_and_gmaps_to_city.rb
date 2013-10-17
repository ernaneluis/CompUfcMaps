class AddLatitudeAndLongitudeAndGmapsToCity < ActiveRecord::Migration
  def change
    add_column :cities, :latitude, :float
    add_column :cities, :longitude, :float
    add_column :cities, :gmaps, :boolean
  end
end
