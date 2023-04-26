FactoryBot.define do
  cns_generation = [
    "161048657310005",
    "206810335240008",
    "823585624430006",
    "865156953450007",
    "739439078330003",
    "179760021470000",
    "804550069910005",
    "294242683590007",
    "761758132650018",
    "993389271120005"
  ].sample

  factory :person, class: Person::Record do
    full_name { Faker::Name.name }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    cns { cns_generation }
    email { Faker::Internet.email }
    birthday { (Date.current - 1.day) }
    phone { Faker::PhoneNumber.cell_phone }
    status { "Ativo" }
    address { association :address }
  end
end