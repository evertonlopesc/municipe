class CreateCounties < ActiveRecord::Migration[7.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.integer :id_ibge
      t.string :state
      t.string :status, default: :active

      t.timestamps
    end
  end
end