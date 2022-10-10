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

ActiveRecord::Schema[7.0].define(version: 2022_10_06_223210) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed"
    t.text "notes"
    t.text "feedback"
    t.integer "rating"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "challenges_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.date "completed"
    t.text "user_notes"
    t.text "res_feedback"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id", "user_id"], name: "index_challenges_users_on_challenge_id_and_user_id"
    t.index ["user_id", "challenge_id"], name: "index_challenges_users_on_user_id_and_challenge_id"
  end

  create_table "path_challenges", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "pathway_id"
    t.integer "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_path_challenges_on_challenge_id"
    t.index ["pathway_id"], name: "index_path_challenges_on_pathway_id"
  end

  create_table "pathways", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.string "difficulty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_challenges", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed"
    t.text "notes"
    t.text "feedback"
    t.integer "rating"
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
  end

  create_table "user_pathways", force: :cascade do |t|
    t.bigint "pathway_id"
    t.bigint "user_id"
    t.datetime "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pathway_id"], name: "index_user_pathways_on_pathway_id"
    t.index ["user_id"], name: "index_user_pathways_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "users"
end
