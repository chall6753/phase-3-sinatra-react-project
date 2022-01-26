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
  ###################################################################
  get "/recipes/:id" do 
    recipe = Recipe.find_by id: params['id']
    comments=Comment.find_each.filter do |comment|
      comment.recipe_id == params['id'].to_i
    end
    chef = Chef.find_by id: recipe.chef_id
    response={}
    ingredients = recipe.ingredients
    response[:ingredients] =ingredients 
    response[:comments]= comments
    response[:chef]= chef
    response.to_json
  end
  ##################################################################
  post "/register" do
    username = params['username']
    password = params['password']
    user = User.create(username: username, password: password)
    if user.valid? == true
      "User Created!".to_json
      else "Username already exists".to_json
    end
  end
  ################################################################
  post "/login" do
    username = params['username']
    password = params['password']
    # go through usernames and make sure the username does not already exist
    users = User.all
    loggedIn=false
    users.each {|user| 
      if user.username == username && user.password == password
        x="Login successful"
        loggedIn=true
      end
    }
    loggedIn.to_json
  end
  ########################################################################
  post "/submit_recipe" do 
    newRecipeIngredients = params["ingredients"]
    chefId = params["chefId"]
    recipeName = params['recipeName']
    instructions = params['instructions']
    
    #create new recipe
    x = Recipe.where(chef_id: chefId).find_or_create_by(recipe_name: recipeName) do |recipe|
      recipe.chef_id = chefId
      recipe.instructions = instructions 
    end
    puts x
    
    #Find out if recipe has ingredients already in the ingredients table. if not create new ingredient
    newRecipeIngredients.map do |ingredient|
      binding.pry
      if Ingredient.find_by(ingredient: ingredient['ingredient'].downcase) #if ingredient already exists create RecipeIngredient instance with the already existing ingredient_id
        ingredient_id = Ingredient.find_by(ingredient: ingredient['ingredient']).id
        RecipeIngredient.create(recipe_id: Recipe.last.id, ingredient_id: ingredient_id, quantity: ingredient['quantity'], unit: ingredient['unit'])
      else #create RecipeIngredient instance with newly created ingredient
        Ingredient.create(ingredient: ingredient['ingredient'].downcase)
        RecipeIngredient.create(recipe_id: Recipe.last.id, ingredient_id: Ingredient.last.id, quantity: ingredient['quantity'], unit: ingredient['unit'])
      end
    end
    "Recipe Created".to_json
  end
end
