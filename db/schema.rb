# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_13_005957) do

  create_table "chefs", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.string "username"
    t.integer "recipe_id"
    t.integer "chef_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredient"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "ingredient_id"
    t.float "quantity"
    t.string "unit"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name"
    t.integer "chef_id"
    t.string "instructions"
  end

end
