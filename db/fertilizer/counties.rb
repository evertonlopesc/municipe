# # frozen_string_literal: true

module Fertilizer
  module Counties
    require 'csv'

    def self.call
      puts "Read file municipios.csv"
      file = File.open("#{Rails.root}/db/fertilizer/municipios.csv")

      puts "Populating to the County table..."
      CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
        County::Record.create_or_find_by(
          name: row[:nome_municpio],
          id_ibge: row[:cdigo_municpio_completo],
          state: row[:nome_uf]
        )
      end

      puts "Close file municipios.csv"
      file.close

      puts "County created successfully!"
    end
  end
end