module County
  class Record < ApplicationRecord
    self.table_name = 'counties'

    has_many :addresses, class_name: '::Address::Record', foreign_key: 'county_id'
    has_many :people, class_name: 'Person::Record', through: :addresses

    enum status: { active: 'Ativo', inactive: 'Inativo' }, _default: :active

    validates_length_of :id_ibge, is: 7
    validates_numericality_of :id_ibge, only_integer: true
    validates_presence_of :id_ibge, :name, :state

    scope :order_by_state_and_name, -> { all.order(:state, :name) }
    scope :filter_by_name, ->(name) { where(name: name) }
    scope :filter_by_state, ->(state) { where(state: state) }
  end
end