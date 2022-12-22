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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_11_21_011532) do
=======
ActiveRecord::Schema[7.0].define(version: 2022_12_12_132900) do
>>>>>>> main
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

<<<<<<< HEAD
  create_table "notes", force: :cascade do |t|
    t.bigint "user_challenge_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_challenge_id"], name: "index_notes_on_user_challenge_id"
=======
  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.bigint "user_challenge_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_challenge_id"], name: "index_comments_on_user_challenge_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
>>>>>>> main
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "difficulty"
    t.index ["user_id"], name: "index_pathways_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "linkedin"
    t.string "github"
    t.text "bio"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "user_challenges", force: :cascade do |t|
    t.bigint "challenge_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "completed"
    t.integer "rating"
    t.text "notes"
    t.bigint "user_pathway_id", null: false
    t.index ["challenge_id"], name: "index_user_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_user_challenges_on_user_id"
    t.index ["user_pathway_id"], name: "index_user_challenges_on_user_pathway_id"
  end

  create_table "user_pathways", force: :cascade do |t|
    t.bigint "pathway_id"
    t.bigint "user_id"
    t.datetime "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
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
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
<<<<<<< HEAD
  add_foreign_key "notes", "user_challenges"
=======
  add_foreign_key "comments", "user_challenges"
  add_foreign_key "comments", "users"
>>>>>>> main
  add_foreign_key "pathways", "users"
  add_foreign_key "user_challenges", "challenges"
  add_foreign_key "user_challenges", "user_pathways"
  add_foreign_key "user_challenges", "users"
end
