# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'
require 'devise'

puts "Gerando 1000 usuários fictícios..."

1000.times do |i|
  email = Faker::Internet.unique.email
  password = Faker::Internet.password(min_length: 16, mix_case: true, special_characters: true)
  encrypted_password = Devise::Encryptor.digest(User, password)

  User.create!(
    email: email,
    encrypted_password: encrypted_password,
    created_at: Faker::Time.backward(days: 365, period: :evening),
    updated_at: Faker::Time.backward(days: 30, period: :morning)
  )

  puts "Usuário #{i + 1} criado" if (i + 1) % 100 == 0
end

puts "1000 usuários criados com sucesso!"