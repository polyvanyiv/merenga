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

ActiveRecord::Schema[7.0].define(version: 2022_12_30_132753) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.decimal "amount"
    t.decimal "pricePerUnit"
    t.decimal "weightPerUnit"
    t.string "store"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "article_id", null: false
    t.index ["article_id"], name: "index_purchases_on_article_id"
  end

  create_table "recipe_details", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "recipe_id", null: false
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_recipe_details_on_article_id"
    t.index ["recipe_id"], name: "index_recipe_details_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "output"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_packages", force: :cascade do |t|
    t.bigint "sale_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.index ["article_id"], name: "index_sale_packages_on_article_id"
    t.index ["sale_id"], name: "index_sale_packages_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.date "orderPlaced"
    t.date "orderDelivery"
    t.string "clientTmp"
    t.decimal "amount"
    t.decimal "cost"
    t.decimal "price"
    t.decimal "discount"
    t.decimal "delivery"
    t.decimal "sum"
    t.decimal "profit"
    t.boolean "processed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_sales_on_recipe_id"
  end

  add_foreign_key "purchases", "articles"
  add_foreign_key "recipe_details", "articles"
  add_foreign_key "recipe_details", "recipes"
  add_foreign_key "sale_packages", "articles"
  add_foreign_key "sale_packages", "sales"
  add_foreign_key "sales", "recipes"
end
