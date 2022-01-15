require "pry"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/chefs" do
    Chef.all.to_json
  end
  get "/recipes" do
    Recipe.all.to_json
  end
  get "/ingredients" do
    Ingredient.all.to_json
  end
  get "/chefs/:id" do
    chefs_recipes = Recipe.find_each.filter do |recipe|
      recipe.chef_id == params['id'].to_i 
    end
    chefs_recipes.to_json
  end
  get "/recipes/:id" do 
    recipe = Recipe.find_by id: params['id']
    comments=Comment.find_each.filter do |comment|
      comment.recipe_id == params['id'].to_i
    end
    chef = Chef.find_by id: params['id']
    response={}
    ingredients = recipe.ingredients
    response[:ingredients] =ingredients 
    response[:comments]= comments
    response[:chef]= chef
    response.to_json
  end
end
