module County
  class Record < ApplicationRecord
    self.table_name = 'counties'

    enum status: {
      active: 'Ativo',
      inactive: 'Desativado'
    }, _default: :active

    validates :id_ibge, {
      presence: true,
      numericality: { only_integer: true },
      length: { is: 7 }
    }
    validates :name, presence: true
    validates :state, presence: true
  end
end