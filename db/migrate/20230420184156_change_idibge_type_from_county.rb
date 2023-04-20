class ChangeIdibgeTypeFromCounty < ActiveRecord::Migration[7.0]
  def change
    change_column :counties, :id_ibge, :string
  end
end