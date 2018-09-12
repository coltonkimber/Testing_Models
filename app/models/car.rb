class Car < ApplicationRecord
  # validates_presence_of :model
  # validates_uniqueness_of :model

  validates :model, uniqueness: true, presence: true

  has_many :passengers

  # sorting the cars by model asc order
  def self.by_model
    # Car.order(:model)
    order(:model)
  end

  # sorting the cars by make desc order
  def self.by_make
    # Car.order(make: :desc)
    order(make: :desc)
  end

  # change the paint or color of a car
  def paint( color )
    self.update(color: color)
  end

  # return all of the info for car
  def info
    self.attributes.except('id', 'created_at', 'updated_at')
  end
end
