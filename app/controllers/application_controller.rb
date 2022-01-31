require "pry"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/recipes' do
    Recipe.all.to_json(:include => [:ingredients, :user, :comments])
    # binding.pry
  end
  get '/chefs' do
    User.all.to_json
  end
  get '/ingredients' do 
    Ingredients.all.to_json
  end
  get '/recipes/:id' do 
    Recipe.find_by(params['id']).to_json(:include => [:ingredients, :user, :comments])
   
  end
  delete '/recipes/:id/delete_recipe' do
    @recipe = Recipe.find(params['id'])
    @recipe.destroy
    @recipe.to_json
  end
  get '/chefs/:id' do
    User.find(params['id']).to_json(:include => {:recipes => {:include => :recipe_ingredients}} )
    
  end
end
