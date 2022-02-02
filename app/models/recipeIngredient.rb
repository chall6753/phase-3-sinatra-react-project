class RecipeIngredient < ActiveRecord::Base
    belongs_to :recipe
    belongs_to :ingredient

    # i need a method where i can send a new recipes ingredients and the method will go through the ingredients and check to see if the Ingredient is already created
    #if the Ingredient already exist create a new RecipeIngredient with it.. if not creat new ingredient then create new RecipeIngredient

    
end