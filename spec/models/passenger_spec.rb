require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'associations' do
    @pass = FactoryBot.create(:passenger)
    
  end
end

describe 'attributes' do
  it 'has an age' do
    age = 20
    passenger = Passenger.create(age: age)
    expect(passenger.age).to eq(age)
  end

  it 'has a name' do 
    name = 'Colton'
    passenger = Passenger.create(name: name)
    expect(passenger.name).to eq(name)
end



describe 'validation' do
  it {should validate_uniqueness_of :model}
  it {should validate_presence_of :model}
end


describe 'class methods' do
  before(:each) do
  @passenger1 = Passenger.create(name: 'Colton', age: 25)
  @passenger2 = Passenger.create(name: "Someone else, I'm too tired to come up with a name", age: 100)
  end
  
  it 'should sort by name :desc' do 
    expect(Passenger.by_name(:desc)).to eq([@passenger2, @passenger1])
  end

end


end