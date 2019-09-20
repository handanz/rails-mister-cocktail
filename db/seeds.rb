# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

puts 'running seeds'
url = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read
ruby_hash = JSON.parse(url)

ingredients = ruby_hash['drinks'].map { |h| h['strIngredient1'] }
ingredients.each { |element| Ingredient.create!(name: element) }

puts 'seeds pupolating the planet'
