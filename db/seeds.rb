require "json"
require "open-uri"
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated?"
movies_db = URI.open(url).read
movies = JSON.parse(movies_db)
results = movies['results']

results.each do |result|
  base_poster_url = "https://image.tmdb.org/t/p/original"
  Movie.create!(
    title: result['title'],
    overview: result['overview'],
    poster_url: "#{base_poster_url}#{result['poster_path']}",
    rating: result['vote_average'])
end
