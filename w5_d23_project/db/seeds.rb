require 'faker'

genre_array = ["action", "horreur", "comédie", "drame"]
100.times do
  fake_movie = Movie.create!(name: Faker::Movie.title, year: rand(1920..2000), genre: genre_array[rand(0..3)], synopsis: Faker::Lorem.sentences(number: 10), director: Faker::Name.name, allocine_rating: rand(0.0..5.0).round(1), my_rating: nil, already_seen: false) 
end

