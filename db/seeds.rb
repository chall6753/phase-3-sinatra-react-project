puts "🌱 Seeding spices..."

# Seed your database here
Chef.create(username_id:1,first_name: "Charlie", last_name: "Hall", bio: "Lorem ipsum dolor sit amet. Ab mollitia quisquam qui reprehenderit voluptas sed corrupti dolorem et cupiditate dolor est delectus sequi et ratione esse. Ea itaque veritatis eum optio dolore in aperiam quas id aliquam consequatur est rerum quaerat ut praesentium adipisci. Ut omnis unde et quia perferendis qui molestias laboriosam sit esse ratione et fuga possimus. Non impedit obcaecati aut quia quod qui ratione assumenda.

Et consequatur Quis ut corrupti dicta aut ratione similique ab consequatur rerum. Eos recusandae necessitatibus ut maiores architecto ut minus saepe qui illum ad minima atque. Hic consequatur similique est itaque ratione sit quia laboriosam et recusandae dolores.

Et libero amet aut magni commodi cum repellat impedit ad debitis excepturi. Cum sint nemo est voluptatem inventore et porro galisum. Ut ipsam totam et voluptatem voluptatum vel voluptatem ratione ut porro eius.")
Recipe.create(recipe_name:"Ribs", instructions: "Smoke 3hrs 180, and 3 hours at 225", chef_id:1)
Ingredient.create(ingredient:"pork ribs")
RecipeIngredient.create(recipe_id: 1, ingredient_id: 1, quantity: 1, unit:"rack")
Comment.create(recipe_id:1, chef_id: 1, comment:"These were the best ribs ever", username:"ricky bobby")
User.create(username: "chall", password: "pass1234")


puts "✅ Done seeding!"
