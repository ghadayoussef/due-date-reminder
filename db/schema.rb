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

ActiveRecord::Schema[7.1].define(version: 2025_06_27_085544) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "assigned_user_id"
    t.date "due_date"
    t.integer "status_id"
    t.integer "progress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assigned_user_id"], name: "index_tickets_on_assigned_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.boolean "send_due_date_reminder", default: false
    t.integer "due_date_reminder_interval", default: 1
    t.time "due_date_reminder_time"
    t.string "time_zone", default: "UTC"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "tickets", "users", column: "assigned_user_id"
end
