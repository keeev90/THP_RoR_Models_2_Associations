class JoinDoctorSpecialty < ApplicationRecord #chaque entrée de la table aura une colonne doctor_id et une colonne specialty_id
  belongs_to :doctor
  belongs_to :specialty
end