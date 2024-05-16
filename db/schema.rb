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

ActiveRecord::Schema[7.1].define(version: 2024_05_16_153907) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "art_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coral_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detailed_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "is_true_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body", null: false
    t.string "author", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "note_items", force: :cascade do |t|
    t.text "body"
    t.bigint "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_note_items_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "note_id", null: false
    t.index ["note_id"], name: "index_notes_users_on_note_id"
    t.index ["user_id"], name: "index_notes_users_on_user_id"
  end

  create_table "quiz_game_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "quiz_game_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["quiz_game_id"], name: "index_quiz_game_users_on_quiz_game_id"
    t.index ["user_id"], name: "index_quiz_game_users_on_user_id"
  end

  create_table "quiz_games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "random_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rivers_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_id", null: false
    t.integer "current_question", default: 1, null: false
    t.integer "count", default: 0, null: false
    t.integer "result", default: 0, null: false
    t.string "current_model"
    t.index ["room_id"], name: "index_rooms_on_room_id", unique: true
  end

  create_table "standard_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "survival_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  create_table "what_mean_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "what_next_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "when_where_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "who_said_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "rooms"
  add_foreign_key "note_items", "notes"
  add_foreign_key "quiz_game_users", "quiz_games"
  add_foreign_key "quiz_game_users", "users"
end
