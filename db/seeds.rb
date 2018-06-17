# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
include Faker

10.times do
    User.create(
        email: Faker::Internet.email,
        password: Faker::Name.first_name
    )
end    

5.times do
    Product.create(
        name: Faker::Internet.email,
        rate: Faker::PhoneNumber.phone_number,
        user_id: 1
    )
end  

5.times do
    Product.create(
        name: Faker::Internet.email,
        rate: Faker::PhoneNumber.phone_number,
        user_id: 2
    )
end  

5.times do
    Order.create(
        user_id:1
    )
end 

5.times do
    Order.create(
        user_id:2
    )
end 