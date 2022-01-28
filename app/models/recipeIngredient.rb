require "pry"

class RecipeIngredient <ActiveRecord::Base
    belongs_to :recipe
    belongs_to :ingredient

    def self.randomn
        binding.pry

    end

end

