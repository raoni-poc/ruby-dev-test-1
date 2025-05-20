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
require "tempfile"
require "zip"

User.first_or_create(
  email: "admin@test.com",
  password: "12345678"
)

puts "Gerando 10 usuários fictícios..."

10.times do |i|
  email = Faker::Internet.unique.email
  password = Faker::Internet.password(min_length: 16, mix_case: true, special_characters: true)

  User.create!(
    email: email,
    password: password,
  )

  puts "Usuário #{i + 1} criado" if (i + 1) % 100 == 0
end

puts "10 usuários criados com sucesso!"

#################################################

puts "Gerando 100 pastas fictícias..."

created_folder_ids = []

100.times do |i|
  parent_id = created_folder_ids.empty? ? nil : created_folder_ids.sample

  folder = Folder.create!(
    name: Faker::File.unique.dir,
    owner: User.first,
    parent_id: parent_id,
    description: Faker::Lorem.sentence,
  )

  created_folder_ids << folder.id

  puts "Pasta #{i + 1} criada" if (i + 1) % 10 == 0
end

puts "100 pastas criadas com sucesso!"

#################################################

puts "Gerando 1000 arquivos ZIP fictícios..."

1000.times do |i|
  # Pega uma pasta aleatória para relacionar
  folder_id = created_folder_ids.sample
  folder = Folder.find(folder_id)

  # Criar arquivo ZIP fictício
  temp_zip = Tempfile.new(["file_#{1+i}", ".zip"])
  Zip::OutputStream.open(temp_zip) do |zos|
    zos.put_next_entry("readme.txt")
    zos.write(Faker::Lorem.sentence)
  end

  uploaded_file = ActionDispatch::Http::UploadedFile.new(
    tempfile: temp_zip,
    filename: "file_#{i + 1}.zip",
    type: 'application/zip'
  )

  params = {
    file: uploaded_file,
    description: Faker::Lorem.sentence,
  }

  file = FileRecords::CreateService.call(params)

  # Associa o arquivo à pasta (has_and_belongs_to_many)
  file.folders << folder

  puts "Arquivo #{i + 1} criado e associado à pasta #{folder.name}" if (i + 1) % 50 == 0
end

puts "1000 arquivos criados com sucesso!"