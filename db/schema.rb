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

ActiveRecord::Schema.define(version: 2023_08_30_085026) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "upvotes_count", default: 0, null: false
    t.integer "downvotes_count", default: 0, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "categorizations", force: :cascade do |t|
    t.bigint "question_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "topic_id"], name: "index_categorizations_on_question_id_and_topic_id", unique: true
    t.index ["question_id"], name: "index_categorizations_on_question_id"
    t.index ["topic_id", "question_id"], name: "index_categorizations_on_topic_id_and_question_id", unique: true
    t.index ["topic_id"], name: "index_categorizations_on_topic_id"
  end

  create_table "downvotes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "downvotable_type", null: false
    t.bigint "downvotable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["downvotable_type", "downvotable_id"], name: "index_downvotes_on_downvotable_type_and_downvotable_id"
    t.index ["user_id", "downvotable_type", "downvotable_id"], name: "index_downvotes_on_user_and_downvotable", unique: true
    t.index ["user_id"], name: "index_downvotes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "upvotes_count", default: 0, null: false
    t.integer "downvotes_count", default: 0, null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "topic_followings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id", "user_id"], name: "index_topic_followings_on_topic_id_and_user_id", unique: true
    t.index ["topic_id"], name: "index_topic_followings_on_topic_id"
    t.index ["user_id", "topic_id"], name: "index_topic_followings_on_user_id_and_topic_id", unique: true
    t.index ["user_id"], name: "index_topic_followings_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_topics_on_title", unique: true
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "upvotable_type", null: false
    t.bigint "upvotable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["upvotable_type", "upvotable_id"], name: "index_upvotes_on_upvotable_type_and_upvotable_id"
    t.index ["user_id", "upvotable_type", "upvotable_id"], name: "index_upvotes_on_user_and_upvotable", unique: true
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", default: "", null: false
    t.string "username", default: "", null: false
    t.integer "age", default: 18, null: false
    t.integer "gender", default: 0, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "categorizations", "questions"
  add_foreign_key "categorizations", "topics"
  add_foreign_key "downvotes", "users"
  add_foreign_key "questions", "users"
  add_foreign_key "topic_followings", "topics"
  add_foreign_key "topic_followings", "users"
  add_foreign_key "topics", "users"
  add_foreign_key "upvotes", "users"
end
