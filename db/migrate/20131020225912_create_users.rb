class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :matricula
      t.integer :anoIngr
      t.integer :anoConc
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
      t.integer :city_id

      t.timestamps
    end
  end
end
