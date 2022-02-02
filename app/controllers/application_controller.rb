require "pry"
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get '/recipes' do
    Recipe.all.to_json(:include => [:ingredients, :user] )
    # binding.pry
  end
  get '/users' do
    User.all.to_json(:include => [:recipes])
  end
  
  get '/recipes/:id' do 
    Recipe.find(params['id']).to_json(:include => [:ingredients, :user])
   
  end
  delete '/recipes/:id/delete_recipe' do
    @recipe = Recipe.find(params['id'])
    @recipe.destroy
    @recipe.to_json
  end
  get '/chefs/:id' do
    User.find(params['id']).to_json(:include => {:recipes => {:include => :recipe_ingredients}} )
  end

  post '/recipe_create' do 
    @user = User.find_or_create_by(username: params['username']) #first checking to see if user already exists if not create new user
    @recipe = @user.recipes.find_or_create_by(name: params['recipeName']) do |recipe| #once the user is found or created we will create a new recipe that is associated to the user unless the recipe for that user already exists
      @r = recipe
      @r.instructions = params['instructions']
    end
    @recipeIngredients = params['recipeIngredients']
    if @r != nil 
      @recipeIngredients.map do |recipe|
        x = Ingredient.find_or_create_by(name: recipe['ingredient']) 
        @recipe.recipe_ingredients.create(quantity: recipe['quantity'], unit: recipe['unit'], ingredient_id: x.id)
      end
    @recipe.to_json(:include => [:ingredients, :user, :comments])
    end
    
    
  end
end
