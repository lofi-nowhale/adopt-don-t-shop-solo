class PetApplication < ApplicationRecord
  belongs_to :pet, optional: true
  belongs_to :application

  validates_numericality_of :pet_id
  validates_numericality_of :application_id
end