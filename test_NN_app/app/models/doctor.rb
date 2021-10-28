### LIER LES MODELS ENTRE EUX ###
class Doctor < ApplicationRecord #respecter cet ordre : has_many... puis has_may...through...
  has_many :appointments
  has_many :patients, through: :appointments
end
