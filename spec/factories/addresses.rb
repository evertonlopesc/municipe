FactoryBot.define do
  factory :address, class: Address::Record do
    cep { Faker::Number.number(digits: 8) }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { "S/A" }
    neighborhood { Faker::Address.city }
    status { :active }
    county { association :county }
  end
end