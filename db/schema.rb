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

ActiveRecord::Schema[7.1].define(version: 4) do
  create_table "monitorships", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_monitorships_on_subject_id"
    t.index ["user_id", "subject_id"], name: "index_monitorships_on_user_id_and_subject_id", unique: true
    t.index ["user_id"], name: "index_monitorships_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_subjects_on_code", unique: true
  end

  create_table "subjects_users", id: false, force: :cascade do |t|
    t.integer "subject_id", null: false
    t.integer "user_id", null: false
    t.index ["subject_id", "user_id"], name: "index_subjects_users_on_subject_id_and_user_id"
    t.index ["user_id", "subject_id"], name: "index_subjects_users_on_user_id_and_subject_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "academic_record", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_record"], name: "index_users_on_academic_record", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "monitorships", "subjects"
  add_foreign_key "monitorships", "users"
end
