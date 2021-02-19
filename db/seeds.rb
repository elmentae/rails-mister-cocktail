# CLEARS THE DB
Ingredient.destroy_all

# READS AND PARSES DATA FROM API
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(URI.open(url).read)

# CREATES MODEL INSTANCES BASED ON RECEIVED DATA
ingredients["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
end
