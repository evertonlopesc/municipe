# frozen_string_literal: true

module Address
  class Record < ApplicationRecord
    self.table_name = 'addresses'

    belongs_to :county, class_name: '::County::Record'

    enum status: { active: 'Active', inactive: 'Inativo' }, _default: :active

    validates :cep, {
      presence: true,
      length: { is: 8 }
    }
    validates :complement, presence: true
    validates :neighborhood, presence: true
    validates :number, presence: true
    validates :street, presence: true
  end
end