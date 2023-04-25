module County
  class Record < ApplicationRecord
    self.table_name = 'counties'

    has_many :addresses, class_name: '::Address::Record',
                         foreign_key: 'county_id'
    has_many :people, class_name: 'Person', through: :addresses

    enum status: { active: 'Ativo', inactive: 'Inativo' }, _default: :active

    validates_length_of :id_ibge, is: 7
    validates_numericality_of :id_ibge, only_integer: true
    validates_presence_of :id_ibge, :name, :state
  end
end