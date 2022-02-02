require 'pry'
class Recipe < ActiveRecord::Base
    belongs_to :user 
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :comments

    # def createIngredients(ingredients)
    #     ingredients.map {|ingredient|
    #         # @newIngredient = Ingredient.find_or_create_by(name: ingredient)
    #         # self.ingredients.create()
    #         binding.pry
    #     }
        
    # end
end