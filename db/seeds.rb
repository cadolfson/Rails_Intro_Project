# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = 'en-CA'

Family.destroy_all
House.destroy_all

require 'net/http'
require 'json'

puts "Generating 50 families..."
50.times do
    house = House.create(
        address: Faker::Address.unique.street_address,
        postal_code: Faker::Address.postcode,
        city: Faker::Address.city,
        provence: Faker::Address.state,
        description: Faker::Address.unique.community)
    family = Family.create(generation: Faker::Number.between(2,9), house: house)
    
    last_name = Faker::Name.last_name
    puts last_name
    puts "  People:"
    number_of_family = Faker::Number.between(0,10)
    number_of_family.times do
        person = family.people.create(
            firstname: Faker::Name.first_name,
            lastname: last_name,
            birthdate: Faker::Date.birthday(18,99),
            height: (Faker::Demographic.height.to_f * 100)
        )
        puts "\t" + person.firstname
    end

    puts "  Pets:"
    number_of_pets = Faker::Number.between(0,4)
    number_of_pets.times do
        dogs_url = URI("https://dog.ceo/api/breeds/image/random")
        response = Net::HTTP.get(dogs_url)
        image_url = JSON.parse(response)['message']
        breed = image_url.split('/')[-2];
        dog = family.dogs.create(
            name: Faker::Creature::Dog.name,
            breed: breed,
            age: Faker::Number.between(0,16),
            colour: Faker::Color.color_name,
            image_url: image_url
        )
        puts "\t" + dog.name + " - " + dog.breed
    end
end
puts "Done!"