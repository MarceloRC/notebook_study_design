namespace :utils do
  desc "Popular Banco de dados"
  task seed: :environment do

  puts "Contatos"
  10.times do |i|
    Contact.create!(
                    name: Faker::Name.name,
                    email: Faker::Internet.email,
                    kind: Kind.all.sample,
                    rmk: Faker::Lorem.sentence
    )
  end
  puts "OK"

  puts "Addresses"
  Contact.all.each do |contact|
    Address.create!(
                      street: Faker::Address.street_address,
                      city: Faker::Address.city,
                      state: Faker::Address.state_abbr, 
                      contact: contact
                    )
  end
  puts "OK"

  puts "Phones"
  Contact.all.each do |contact|
    Random.rand(1..5).times do |i|
      Phone.create!(
                      phone: Faker::PhoneNumber.phone_number ,
                      contact: contact
                    )
      end
    end
    puts "OK"  
  end
end
