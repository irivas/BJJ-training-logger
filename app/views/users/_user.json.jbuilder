json.extract! user, :id, :name, :surname, :email, :age, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
