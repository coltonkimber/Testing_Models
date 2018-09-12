class Passenger < ApplicationRecord
  belongs_to :car
  validates :model, presence: true, uniqueness: true

def self.by_name(direction = :desc)
end












end


