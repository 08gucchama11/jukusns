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

ActiveRecord::Schema[8.0].define(version: 2026_08_25_234933) do
  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "code", null: false
    t.index ["code"], name: "index_admins_on_code", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.text "body", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "sns_profile_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["sns_profile_id"], name: "index_comments_on_sns_profile_id"
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_sns_profile_id", null: false
    t.integer "followed_sns_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_sns_profile_id"], name: "index_follows_on_followed_sns_profile_id"
    t.index ["follower_sns_profile_id", "followed_sns_profile_id"], name: "idx_on_follower_sns_profile_id_followed_sns_profile_b715f2ecc8", unique: true
    t.index ["follower_sns_profile_id"], name: "index_follows_on_follower_sns_profile_id"
  end

  create_table "instruction_records", force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "student_id", null: false
    t.integer "subject", null: false
    t.string "unit", null: false
    t.text "instruction_record", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_instruction_records_on_student_id"
    t.index ["teacher_id"], name: "index_instruction_records_on_teacher_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "sns_profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id", "sns_profile_id"], name: "index_likes_on_post_id_and_sns_profile_id", unique: true
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["sns_profile_id"], name: "index_likes_on_sns_profile_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "sns_profile_id", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sns_profile_id"], name: "index_posts_on_sns_profile_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "teacher_id"
    t.integer "student_id"
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_sessions_on_admin_id"
    t.index ["student_id"], name: "index_sessions_on_student_id"
    t.index ["teacher_id"], name: "index_sessions_on_teacher_id"
  end

  create_table "sns_profiles", force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
    t.string "nickname", null: false
    t.string "introduction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_sns_profiles_on_student_id", unique: true
    t.index ["teacher_id"], name: "index_sns_profiles_on_teacher_id", unique: true
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "code", null: false
    t.string "school", null: false
    t.integer "grade", null: false
    t.string "postal_code", null: false
    t.string "address", null: false
    t.string "telephone_number", null: false
    t.string "parent_name", null: false
    t.string "parent_telephone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.index ["code"], name: "index_students_on_code", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "code", null: false
    t.string "telephone_number", null: false
    t.boolean "is_active", default: true, null: false
    t.index ["code"], name: "index_teachers_on_code", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "sns_profiles"
  add_foreign_key "follows", "sns_profiles", column: "followed_sns_profile_id"
  add_foreign_key "follows", "sns_profiles", column: "follower_sns_profile_id"
  add_foreign_key "instruction_records", "students"
  add_foreign_key "instruction_records", "teachers"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "sns_profiles"
  add_foreign_key "posts", "sns_profiles"
  add_foreign_key "sessions", "admins"
  add_foreign_key "sessions", "students"
  add_foreign_key "sessions", "teachers"
  add_foreign_key "sns_profiles", "students"
  add_foreign_key "sns_profiles", "teachers"
end
