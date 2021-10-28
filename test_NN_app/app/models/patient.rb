### LIER LES MODELS ENTRE EUX ###
class Patient < ApplicationRecord #respecter cet ordre : has_many... puis has_may...through...
  has_many :appointments
  has_many :doctors, through: :appointments
end
