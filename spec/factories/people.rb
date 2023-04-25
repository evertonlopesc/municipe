FactoryBot.define do
  factory :person, class: Person::Record do
    full_name { "MyString" }
    cpf { "MyString" }
    cns { "846922218470005" }
    email { "MyString@email.com" }
    birthday { (Date.current - 1.day) }
    phone { "MyString" }
    status { "Ativo" }
    address { association :address }
  end
end