class RemoveColumnSpecialtyFromDoctorTable < ActiveRecord::Migration[5.2] #supprime la colonne specialty de la table car finalement un docteur peut avoir plusieurs spécialités (> nécessite la création d'une table dédiée Speciality)
  def change
    remove_column :doctors, :specialty
  end
end
