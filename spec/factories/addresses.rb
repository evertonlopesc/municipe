FactoryBot.define do
  factory :address, class: Address::Record do
    cep { "00000000" }
    street { "Rua pertim de casa" }
    number { "123-A" }
    complement { "S/A" }
    neighborhood { "Aquele" }
    status { "Active" }
    county { association :county }
  end
end