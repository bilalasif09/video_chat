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

ActiveRecord::Schema[7.1].define(version: 2024_12_08_071755) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "token", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  create_table "v_chats", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "ended_at"
    t.string "token"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_v_chats_on_token", unique: true
    t.index ["user_id"], name: "index_v_chats_on_user_id"
  end

  create_table "v_participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "v_chat_id", null: false
    t.datetime "joined_at"
    t.datetime "left_at"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["v_chat_id", "user_id"], name: "index_v_participants"
  end

end
