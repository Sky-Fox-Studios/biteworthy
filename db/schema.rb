# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150904233208) do

  create_table "addresses", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string  "street"
    t.string  "city",                     default: "Durango"
    t.string  "state",                    default: "CO"
    t.integer "zip",                      default: 81301
    t.float   "latitude",      limit: 12
    t.float   "longitude",     limit: 12
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods_ingredients", force: :cascade do |t|
    t.integer  "food_id"
    t.integer  "ingredient_id"
    t.boolean  "local"
    t.boolean  "organic"
    t.boolean  "naturally_grown"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods_tags", force: :cascade do |t|
    t.integer "food_id"
    t.integer "tag_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.boolean  "fruit",             default: false
    t.boolean  "herb",              default: false
    t.boolean  "grain",             default: false
    t.boolean  "nut",               default: false
    t.boolean  "bean_legume_pulse", default: false
    t.boolean  "vegetable",         default: false
    t.boolean  "animal_product",    default: false
    t.boolean  "dairy",             default: false
    t.boolean  "meat",              default: false
    t.boolean  "poultry",           default: false
    t.boolean  "fish",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "menu_group_id"
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_foods", force: :cascade do |t|
    t.integer "food_id"
    t.integer "item_id"
  end

  create_table "menu_groups", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "menu_order"
    t.string   "name"
    t.string   "description"
    t.string   "background_color"
    t.string   "text_color"
    t.boolean  "is_food_group"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_groups_tags", force: :cascade do |t|
    t.integer "menu_group_id"
    t.integer "tag_id"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "item_id"
    t.float   "price"
    t.string  "size"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "phone_number"
    t.string   "main_image_url"
    t.string   "about"
    t.string   "disclaimer"
    t.string   "website"
    t.integer  "seating"
    t.integer  "outside_seating"
    t.boolean  "cash_only"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_tags", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "tag_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "review_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tag_histories", force: :cascade do |t|
    t.string   "tag_id"
    t.string   "name"
    t.integer  "created_by_id"
    t.integer  "last_modified_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_families", force: :cascade do |t|
    t.integer  "parent_tag_id"
    t.integer  "child_tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_groups_relations", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name",              default: "", null: false
    t.string   "first_name",             default: "", null: false
    t.string   "last_name",              default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.boolean  "approved"
    t.boolean  "is_admin"
    t.boolean  "is_editor"
    t.boolean  "is_staff"
    t.integer  "strikes"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
