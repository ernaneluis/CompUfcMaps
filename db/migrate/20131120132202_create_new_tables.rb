class CreateNewTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :matricula
      t.string :anoIngr
      t.string :anoConc
      t.string :universidade
      t.string :curso
      t.string :cidade

      t.timestamps
    end

    create_table :places do |t|
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end

    create_table :objectives do |t|
      t.string :objectiveType
      t.string :Instituicao
      t.string  :periodoIni
      t.string  :periodoFim
      t.belongs_to :user
      t.belongs_to :place
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps

      t.timestamps
    end
  end
end

