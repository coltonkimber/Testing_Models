require 'rails_helper'

RSpec.describe Car, type: :model do
  
  describe 'testing attributes' do

    # it 'has a model' do
    #   model = 'Prius'
    #   car = Car.create(model: model)
    #   expect(car.model).to eq(model)
    # end

    # it 'has a make' do
    #   make = 'Toyota'
    #   car = Car.create(make: make)
    #   expect(car.make).to eq(make)
    # end

    it { should respond_to :make }
    it { should respond_to :model }
    it { should respond_to :price }

  end

  describe 'testing vailidations' do
    it { should validate_uniqueness_of :model }
    it { should validate_presence_of :model }
  end

  describe 'testing class methods' do
    before(:each) do
      @car1 = Car.create(make: 'Jeep', model: 'Comander', price: 1000)
      @car2 = Car.create(make: 'Subaru', model: 'WRX', price: 18000)
      @car3 = Car.create(make: 'Toyota', model: 'Rav4', price: 7)
    end

    it 'should sort by make :des' do
      expect(Car.by_make).to eq([@car3, @car2, @car1])
    end

    it 'should sort by model :asc' do
      expect(Car.by_model).to eq([@car1, @car3, @car2])
    end
  end

  describe 'testing instance methods' do
    before(:each) do
      # @attr = {
      #   make: 'Toyota',
      #   model: 'Prius',
      #   color: 'Red',
      #   mileage: 10000,
      #   price: 200.00,
      #   age: 2,
      #   interior: 'Blue'
      # }

      # @car = Car.create(@attr)

      @car = FactoryBot.create(:car, age: 6)
    end

    it 'paints a car' do
      @car.paint('Black')
      expect(@car.color).to eq('Black')
    end

    it 'return a cars info' do
      expect(@car.info).to eq(@attr.with_indifferent_access)
    end

  end

end
