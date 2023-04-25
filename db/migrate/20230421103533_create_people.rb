class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :full_name
      t.string :cpf
      t.string :cns
      t.string :email
      t.date :birthday, default: Date.current
      t.string :phone
      t.string :status, default: 'active'
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end

    add_index(:people, :full_name, unique: true)
    add_index(:people, :email, unique: true)
  end
end