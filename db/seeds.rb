require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
user_serialized = open(url).read
list = JSON.parse(user_serialized)

list['drinks'].each do |ingredient|
  Ingredient.create(name: ingredient['strIngredient1'])
end
