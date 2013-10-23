class CreateObjectives < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :matricula
      t.integer :anoIngr
      t.integer :anoConc

      t.timestamps
    end
    create_table :places do |t|
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
    create_table :objectives do |t|
      t.string :objectiveType
      t.string :Instituicao
      t.string  :periodoIni
      t.string  :periodoFim
      t.belongs_to :user
      t.belongs_to :place

      t.timestamps
    end
  end
end
