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

ActiveRecord::Schema.define(version: 2021_05_25_090657) do

  create_table "blog_posts", force: :cascade do |t|
    t.text "title", null: false
    t.text "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sent_emails", force: :cascade do |t|
    t.text "email_name", null: false
    t.text "message_id"
    t.string "entity_type"
    t.integer "entity_id"
    t.integer "status", default: 0, null: false
    t.datetime "opened_at"
    t.text "error"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_name"], name: "index_sent_emails_on_email_name"
    t.index ["entity_id"], name: "index_sent_emails_on_entity_id"
    t.index ["entity_type", "entity_id"], name: "index_sent_emails_on_entity"
    t.index ["message_id"], name: "index_sent_emails_on_message_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "email", null: false
    t.text "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
