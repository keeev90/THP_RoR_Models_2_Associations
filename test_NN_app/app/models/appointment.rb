### LIER LES MODELS ENTRE EUX ###
# la table intermédiaire ("join table") permet de découper 1 relation NN en 2 relations 1N
class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
end
