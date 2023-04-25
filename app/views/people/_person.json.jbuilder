json.extract! person, :id, :full_name, :cpf, :cns, :email, :birthday, :phone, :status, :address_id, :created_at, :updated_at
json.url person_url(person, format: :json)
