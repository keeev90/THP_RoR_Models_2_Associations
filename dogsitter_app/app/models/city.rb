class City < ApplicationRecord
  has_many :strolls
  has_many :doctors, through: :strolls
  has_many :dogs, through: :strolls
end
