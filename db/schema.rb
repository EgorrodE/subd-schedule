# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20171114233724) do

  create_table "cases", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classroom_types", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classroom_types_subjects", force: :cascade do |t|
    t.integer  "classroom_type_id", null: false
    t.integer  "subject_id",        null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "classroom_types_subjects", ["classroom_type_id", "subject_id"], name: "classroom_type_and_subject_unique", unique: true
  add_index "classroom_types_subjects", ["classroom_type_id"], name: "index_classroom_types_subjects_on_classroom_type_id"
  add_index "classroom_types_subjects", ["subject_id"], name: "index_classroom_types_subjects_on_subject_id"

  create_table "classrooms", force: :cascade do |t|
    t.string   "name",              null: false
    t.integer  "places_avaliable",  null: false
    t.integer  "case_id",           null: false
    t.integer  "classroom_type_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "classrooms", ["case_id"], name: "index_classrooms_on_case_id"
  add_index "classrooms", ["classroom_type_id"], name: "index_classrooms_on_classroom_type_id"
  add_index "classrooms", ["name", "case_id"], name: "index_classrooms_on_name_and_case_id", unique: true

  create_table "pairs", force: :cascade do |t|
    t.integer  "students_quantity"
    t.integer  "teacher_id",        null: false
    t.integer  "subject_id",        null: false
    t.integer  "classroom_id",      null: false
    t.integer  "schedule_place_id", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "pairs", ["classroom_id"], name: "index_pairs_on_classroom_id"
  add_index "pairs", ["schedule_place_id"], name: "index_pairs_on_schedule_place_id"
  add_index "pairs", ["subject_id"], name: "index_pairs_on_subject_id"
  add_index "pairs", ["teacher_id"], name: "index_pairs_on_teacher_id"

  create_table "schedule_places", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time",   null: false
    t.integer  "weekday_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "schedule_places", ["weekday_id"], name: "index_schedule_places_on_weekday_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "middle_name", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "weekdays", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
