### RELATION N-N : LIAISONS DE TYPE 1-N AVEC LA TABLE INTERMEDIAIRE ###

class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true #rajout de l'id médecin (foreign key)
      t.belongs_to :patient, index: true #rajout de l'id patient (foreign key)
      t.timestamps
    end
  end
end
