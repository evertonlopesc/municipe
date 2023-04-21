module County
  class Record < ApplicationRecord
    self.table_name = 'counties'

    has_many :addresses, class_name: '::Address::Record',
                         foreign_key: 'county_id'

    enum status: { active: 'Ativo', inactive: 'Inativo' }, _default: :active

    validates :id_ibge, {
      presence: true,
      numericality: { only_integer: true },
      length: { is: 7 }
    }
    validates :name, presence: true
    validates :state, presence: true
  end
end
