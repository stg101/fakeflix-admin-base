# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

status = ["billboard", "preorder", "coming-soon" ]

# seed movies
10.times do
  movie = Movie.create(
    description: Faker::Movies::VForVendetta.quote,
    duration: rand(7200) + 1,
    price: rand(100),
    rating: rand(5) + 1,
    title: Faker::Movie.quote,
    status: rand(3)
  )
  serie = Serie.create(
    description: Faker::Movies::VForVendetta.quote,
    price: rand(100),
    rating: rand(5) + 1,
    title: Faker::Movie.quote,
    status: rand(3)
  )

  5.times do
    Episode.create(
      description: Faker::Movies::VForVendetta.quote,
      duration: rand(7200) + 1,
      title: Faker::Movie.quote,
      serie_id: serie.id
    )
  end

  if rand(2) == 0
    movie.rentals.create( paid_price: rand(400) + 1 ) 
  end

  if rand(2) == 0
    serie.rentals.create( paid_price: rand(400) + 1 ) 
  end

  

  
end