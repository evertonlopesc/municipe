# frozen_string_literal: true

module Address
  class Record < ApplicationRecord
    self.table_name = 'addresses'

    belongs_to :county, class_name: '::County::Record'
    has_many :people, class_name: '::Person::Record', foreign_key: 'address_id'

    enum status: { active: 'Ativo', inactive: 'Inativo' }, _default: :active

    validates_presence_of :cep, :complement, :neighborhood, :number, :street
    validates_length_of :cep, is: 8

    scope :search_by_street, ->(street) { where("LOWER(street) like ?", "%#{street.downcase}%") }
  end
end