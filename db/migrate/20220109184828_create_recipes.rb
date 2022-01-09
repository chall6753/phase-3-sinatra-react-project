class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :recipe_name 
      t.integer :creator_id
      t.string :instructions
    end
  end
end
