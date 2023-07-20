json.extract! banco, :id, :nome, :sigla, :email, :ni, :capital, :pais, :created_at, :updated_at
json.url banco_url(banco, format: :json)
