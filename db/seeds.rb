# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do |n|
    banco = Banco.create!(
        nome: Faker::Name.name,
        email: Faker::Internet.email,
        sigla: "AA",
        ni: Faker::Number.between(from: 10, to: 100),
        capital: Faker::Number.between(from: 100, to: 9999),
        pais: "BBB",
        created_at: Time.current,
        updated_at: Time.current
    )
  
    2.times do |n|
        DepositoBanco.create!(
            banco_id: banco.id,
            valor: Faker::Number.between(from: 100, to: 9999),
            obs: Faker::Lorem.paragraph
        )
    end
end