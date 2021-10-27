require 'faker'

genre_array = ["action", "horreur", "comédie", "drame"]
100.times do
  fake_movie = Movie.create!(
    name: Faker::Movie.unique.title,
    year: rand(1920..2000),
    genre: genre_array[rand(0..3)],
    synopsis: Faker::Lorem.sentences(number: 10),
    director: Faker::Name.name,
    allocine_rating: rand(0.0..5.0).round(1),
    my_rating: nil,
    already_seen: false
  )
end

# Version PP
=begin
genre = ['action', 'horreur', 'comédie', 'drame']
100.times do |movie|
  current_genre = genre[rand(4)]
  Movie.create(
    name:Faker::Movie.unique.title, 
    year:Faker::Date.between(from: '1900-01-01', to: '2020-10-20'),
    genre: current_genre, 
    synopsis:Faker::Lorem.words(number: 10).join(" "),
    director:Faker::Name.unique.name,
    allocine_rating: rand(0.0..5.0).round(1),
    my_rating: nil,
    already_seen: false
  )
end
=end
