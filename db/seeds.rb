puts "🌱 Seeding spices..."

# Seed your database here
Chef.create(first_name: "Charlie", last_name: "hall")
Recipe.create(recipe_name:"Ribs", instructions: "Smoke 3hrs 180, and 3 hours at 225", chef_id:2)
Ingredient.create(ingredient:"pork ribs")
RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, quantity: 1, unit:"rack")
Comment.create(recipe_id:1, chef_id: 1, comment:"These were the best ribs ever", username:"ricky bobby")


puts "✅ Done seeding!"
