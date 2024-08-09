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

ActiveRecord::Schema[7.1].define(version: 2024_08_09_105532) do
  create_schema "auth"
  create_schema "extensions"
  create_schema "graphql"
  create_schema "graphql_public"
  create_schema "pgbouncer"
  create_schema "pgsodium"
  create_schema "pgsodium_masks"
  create_schema "realtime"
  create_schema "storage"
  create_schema "vault"

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_graphql"
  enable_extension "pg_stat_statements"
  enable_extension "pgcrypto"
  enable_extension "pgjwt"
  enable_extension "pgsodium"
  enable_extension "plpgsql"
  enable_extension "supabase_vault"
  enable_extension "uuid-ossp"

  create_table "ahnenerbe_artifacts_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "art_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "astronomy_space_objects_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avionics_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "cocktails_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "code_testing_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "cyber_secure_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "danish_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "disciples2_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drones_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "elf_types_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ends_of_the_world_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "english_tenses_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folk_food_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "global_historical_periods_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heroes3_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_figures_conquerors_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_weapons_characteristics_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "islam_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "japanese_swords_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jeanne_latudas_life_stories_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lord_of_the_rings_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magic_artifacts_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "magic_books_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "martial_arts_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "morrowind_oblivion_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movies_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mythical_locations_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mythological_creatures_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "napoleon_bonapartes_life_stories_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "netherlands_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "old_testament_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ottoman_empire_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peoples_of_the_world_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "potential_space_technologies_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "programming_languages_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "game_status", default: "configuring"
    t.string "questions_source"
    t.integer "questions_counter", default: 1
  end

  create_table "quiz_players", force: :cascade do |t|
    t.integer "player_id"
    t.text "player_answers", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "quiz_game_id"
    t.string "player_color"
    t.index ["player_id"], name: "index_quiz_players_on_player_id"
    t.index ["quiz_game_id"], name: "index_quiz_players_on_quiz_game_id"
  end

  create_table "radio_communication_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "radio_systems_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "rare_nationalities_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "roman_empire_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_classes_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_exeptions_blocks_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_meta_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_on_rails_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ruby_websockets_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servers_admin_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "silk_road_cities_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "somalia_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spy_intelligence_technology_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standard_questions", force: :cascade do |t|
    t.string "question", null: false
    t.jsonb "options", default: [], null: false, array: true
    t.jsonb "answer", default: [], null: false, array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "story_of_captain_william_kidd_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "tactical_medicine_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taiwan_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tale_of_the_templars_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_most_durable_flexible_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tom_bombadil_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turkey_history_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
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

  create_table "world_conflicts_resolution_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "world_sects_questions", force: :cascade do |t|
    t.string "question"
    t.text "options", default: [], array: true
    t.string "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "note_items", "notes"
  add_foreign_key "quiz_game_users", "quiz_games"
  add_foreign_key "quiz_game_users", "users"
  add_foreign_key "quiz_players", "quiz_games"
end
