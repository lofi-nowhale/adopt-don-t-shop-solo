class Application < ApplicationRecord
  has_many :pet_applications
  has_many :pets, through: :pet_applications


  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :state
  validates_numericality_of :zipcode
  validates_presence_of :description
  validates_presence_of :status
  enum status: ['In Progress', 'Pending', 'Accepted', 'Rejected']
end