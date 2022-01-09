puts "🌱 Seeding spices..."

# Seed your database here
Creator.create(first_name: "Charlie", last_name: "hall")
Recipe.create(recipe_name:"Ribs", instructions: "Smoke 3hrs 180, and 3 hours at 225", creator_id:1)
Ingredient.create(ingredient:"pork ribs", quantity:1,unit:"rack", recipe_id:1)


puts "✅ Done seeding!"
