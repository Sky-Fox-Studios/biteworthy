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

  create_table "additions", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "additions_foods", force: :cascade do |t|
    t.integer "addition_id"
    t.integer "food_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.integer "restaurant_id"
    t.string  "phone_number"
    t.string  "street"
    t.string  "city",                                   default: "Durango"
    t.string  "state",                                  default: "CO"
    t.integer "zip",                                    default: 81301
    t.decimal "latitude",      precision: 10, scale: 6
    t.decimal "longitude",     precision: 10, scale: 6
  end

  create_table "choices", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "choices_foods", force: :cascade do |t|
    t.integer "choice_id"
    t.integer "food_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods_tags", force: :cascade do |t|
    t.integer "food_id"
    t.integer "tag_id"
  end

  create_table "hours", force: :cascade do |t|
    t.time     "opening"
    t.time     "closing"
    t.integer  "day"
    t.integer  "hour_id"
    t.string   "hour_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "normalized_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients_tags", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "tag_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items_additions", force: :cascade do |t|
    t.integer "item_id"
    t.integer "addition_id"
  end

  create_table "items_choices", force: :cascade do |t|
    t.integer "item_id"
    t.integer "choice_id"
  end

  create_table "items_foods", force: :cascade do |t|
    t.integer "item_id"
    t.integer "food_id"
  end

  create_table "items_ingredients", force: :cascade do |t|
    t.integer "item_id"
    t.integer "ingredient_id"
  end

  create_table "items_menu_groups", force: :cascade do |t|
    t.integer "item_id"
    t.integer "menu_group_id"
  end

  add_index "items_menu_groups", ["item_id"], name: "index_items_menu_groups_on_item_id"
  add_index "items_menu_groups", ["menu_group_id"], name: "index_items_menu_groups_on_menu_group_id"

  create_table "menu_groups", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "menu_order",       default: 1
    t.string   "name"
    t.string   "description"
    t.string   "background_color"
    t.string   "text_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_groups_menus", force: :cascade do |t|
    t.integer "menu_group_id"
    t.integer "menu_id"
  end

  add_index "menu_groups_menus", ["menu_group_id"], name: "index_menu_groups_menus_on_menu_group_id"
  add_index "menu_groups_menus", ["menu_id"], name: "index_menu_groups_menus_on_menu_id"

  create_table "menu_groups_tags", force: :cascade do |t|
    t.integer "menu_group_id"
    t.integer "tag_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.string   "name",             default: "Default"
    t.string   "description"
    t.string   "background_color"
    t.string   "text_color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "photo_id"
    t.string   "photo_type"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "image_type",         default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prices", force: :cascade do |t|
    t.integer "priced_id"
    t.string  "priced_type"
    t.float   "value"
    t.string  "size"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "slogan"
    t.string   "main_image_url"
    t.string   "about"
    t.string   "disclaimer"
    t.string   "website"
    t.integer  "inside_seating"
    t.integer  "outside_seating"
    t.boolean  "cash_only?"
    t.boolean  "will_deliver?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_tags", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "tag_id"
  end

  create_table "restaurants_users", force: :cascade do |t|
    t.integer "restaurant_id"
    t.integer "user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "review_id"
    t.string   "review_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "single_day?"
    t.integer  "season_id"
    t.string   "season_type"
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

  create_table "user_roles", force: :cascade do |t|
    t.string   "key"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_roles", ["key"], name: "index_user_roles_on_key", unique: true

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
    t.boolean  "banned"
    t.datetime "banned_at"
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

  create_table "users_roles", force: :cascade do |t|
    t.string   "user_id"
    t.string   "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
