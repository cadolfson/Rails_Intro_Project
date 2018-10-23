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

dogs_url = URL("https://dog.ceo/api/breeds/list/all")
puts "Getting dogs from " + dogs_url.to_s
response = Net::HTTP.get(dogs_url)
breeds = JSON.parse(response)['message']

50.times do
    house = House.create(
        address: Faker::Address.unique.street_address,
        postal_code: Faker::Address.postcode,
        city: Faker::Address.city,
        provence: Faker::Address.state,
        description: Faker::Address.unique.community)
    family = Family.create(generation: Faker::Number.between(2,9), house: house)
    number_of_family = Faker::Number.between(0,10)
    number_of_family.times do
        house.people.create(
            firstname: Faker::Name.first_name,
            lastname: Faker::Name.last_name,
            birthdate: Faker::Date.birthday(18,99),
            height: Faker::Demographic.height(:metric)
        )
    end
end