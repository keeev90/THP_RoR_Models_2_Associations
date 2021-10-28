class AddCityAsFkToAllTables < ActiveRecord::Migration[5.2] #ajoute une colonne city (en tant que foreign key) à chaque table
  def change
    add_reference :doctors, :city, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key: true
  end
end
