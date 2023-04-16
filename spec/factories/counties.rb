require 'rails_helper'

FactoryBot.define do
  factory :county, class: County::Record do
    name { "Fortaleza" }
    id_ibge { "1100085" }
    state { "Ceará" }
    status { "active" }
  end
end