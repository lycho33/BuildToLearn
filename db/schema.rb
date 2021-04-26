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

ActiveRecord::Schema.define(version: 2021_04_26_182050) do

  create_table "discusses", force: :cascade do |t|
    t.text "content"
    t.datetime "date"
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_discusses_on_lesson_id"
    t.index ["user_id"], name: "index_discusses_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "tdopic"
    t.string "content"
    t.boolean "lesson_completed"
    t.integer "user_id", null: false
    t.integer "student_id", null: false
    t.integer "mentor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentor_id"], name: "index_lessons_on_mentor_id"
    t.index ["student_id"], name: "index_lessons_on_student_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "mentors", force: :cascade do |t|
    t.string "name"
    t.integer "num_of_lessons"
    t.string "topics"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_mentors_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "progress_level"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "discusses", "lessons"
  add_foreign_key "discusses", "users"
  add_foreign_key "lessons", "mentors"
  add_foreign_key "lessons", "students"
  add_foreign_key "lessons", "users"
  add_foreign_key "mentors", "users"
  add_foreign_key "students", "users"
end
