module Person
  class Record < ApplicationRecord
    self.table_name = "people"

    belongs_to :address, class_name: "Address::Record"
    has_one :county, class_name: "County::Record", through: :address

    enum status: { active: "Ativo", inactive: "Inativo" }, _default: :active

    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_length_of :cns, is: 15
    validates_numericality_of :cns, only_integer: true
    validates_presence_of :birthday, :cpf, :cns, :email, :full_name, :phone
    validates_uniqueness_of :email

    validate :birthday_less_than_today
    validate :cns_allowed

    private

    def birthday_less_than_today
      return if birthday.nil?
      return if birthday <= Date.current

      errors.add(:birthday, "deve ter a data menor que hoje!")
    end

    def cns_allowed
      return if cns.nil?

      cns_start = ["7", "8", "9"]
      cns_start.include?(cns[0]) ? cns_prov_valid(cns: cns) : cns_valid(cns: cns)
    end

    def cns_valid(cns:)
      pis = cns.slice(0, 11)
      aggregate = sum_cns_digits(pis: pis, cns: cns)

      rest = aggregate % 11
      dv = 11 - rest
      dv = 0 if dv == 11

      if dv == 10
        aggregate = sum_cns_digits(pis: pis, cns: cns) + 2

        rest = aggregate % 11
        dv = 11 - rest
        result = "#{pis}001#{dv}"
      else
        result = "#{pis}000#{dv}"
      end

      errors.add(:cns, "inválido!") unless cns == result
    end

    def sum_cns_digits(pis:, cns:)
      aggregate = 0

      pis.chars.each_index do |index|
        break if (cns.length - index) == 4

        aggregate += (pis[index].to_i * (cns.length - index))
      end

      aggregate
    end

    def cns_prov_valid(cns:)
      aggregate = 0

      cns.chars.each_index do |index|
        aggregate += cns[index].to_i * (cns.length - index)
      end

      errors.add(:cns, "inválido!") unless (aggregate % 11).zero?
    end
  end
end