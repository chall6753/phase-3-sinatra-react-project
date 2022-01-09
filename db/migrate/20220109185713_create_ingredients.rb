class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.string :ingredient 
      t.float :quantity
      t.string :unit 
      t.integer :recipe_id 
    end
  end
end
