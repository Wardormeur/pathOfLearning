# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_28_084425) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resources", force: :cascade do |t|
    t.string "url"
    t.string "type_of"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url", default: "https://placekitten.com/300/200"
  end

  create_table "steps", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "track_id"
    t.bigint "resource_id"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_steps_on_ancestry"
    t.index ["resource_id"], name: "index_steps_on_resource_id"
    t.index ["track_id"], name: "index_steps_on_track_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "name"
    t.string "language"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "steps", "resources"
  add_foreign_key "steps", "tracks"
end
