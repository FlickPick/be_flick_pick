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

ActiveRecord::Schema[7.0].define(version: 2023_11_09_004259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "liked_movies", force: :cascade do |t|
    t.bigint "temp_user_id", null: false
    t.integer "movie_id"
    t.integer "round"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temp_user_id"], name: "index_liked_movies_on_temp_user_id"
  end

  create_table "parties", force: :cascade do |t|
    t.string "access_code"
    t.string "max_rating"
    t.integer "max_duration"
    t.string "genres"
    t.string "services"
    t.integer "movie_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temp_users", force: :cascade do |t|
    t.string "name"
    t.bigint "party_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_temp_users_on_party_id"
  end

  create_table "user_parties", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.bigint "parties_id", null: false
    t.boolean "host", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parties_id"], name: "index_user_parties_on_parties_id"
    t.index ["users_id"], name: "index_user_parties_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "liked_movies", "temp_users"
  add_foreign_key "temp_users", "parties"
  add_foreign_key "user_parties", "parties", column: "parties_id"
  add_foreign_key "user_parties", "users", column: "users_id"
end
