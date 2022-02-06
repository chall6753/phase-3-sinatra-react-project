class RecipeController < ApplicationController
    get '/recipes' do
        Recipe.all.to_json(include: [:ingredients, :user, :recipe_ingredients] )
    end
    get '/recipes/:id' do 
        # @recipe = Recipe.find(params['id']).to_json(:include => [:user, :ingredients => { :include=> :recipe_ingredients}])
        @recipe = Recipe.find(params['id']).to_json(:include => [:user, :recipe_ingredients => {:include => :ingredient}])
        # binding.pry
    end
    delete '/recipes/:id/delete_recipe' do
        @recipe = Recipe.find(params['id'])
        @recipe.destroy
        @recipe.to_json
    end
    post '/recipe_create' do 
        @user = User.find_or_create_by(username: params['username']) #first checking to see if user already exists if not create new user
        @recipe = @user.recipes.find_or_create_by(name: params['recipeName']) do |recipe| #create a new recipe that is associated to the user unless the recipe for that user already exists
            @r = recipe
            @r.instructions = params['instructions']
        end
        @recipeIngredients = params['recipeIngredients']
        #if the recipe is a new recipe we need to check the ingredient list to see if any of the ingredients already exist
        #if they do exist we go ahead and make a recipe_ingredient with the already existing ingredient_id
        #if they dont exist create a new ingredient then create new recipe_ingredient
        if @r != nil 
            @recipeIngredients.map do |recipe|
                @recipeIngredient = Ingredient.find_or_create_by(name: recipe['ingredient']) 
                @recipe.recipe_ingredients.create(quantity: recipe['quantity'], unit: recipe['unit'], ingredient_id: @recipeIngredient.id)
            end
        end
            @recipe.to_json(:include => [:user])
    end

end