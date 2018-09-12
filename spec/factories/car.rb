FactoryBot.define do
  factory :car, class: Car do
    make 'Toyota'
    model 'Prius'
    color 'Red'
    mileage 10000
    price 200.00
    age 2
    interior 'Blue'
  end

end