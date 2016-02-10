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

ActiveRecord::Schema.define(version: 20160210213447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geojson_layers", force: true do |t|
    t.string   "name"
    t.string   "file_uid"
    t.string   "file_name"
    t.boolean  "active",      default: true
    t.text     "legend"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "popup"
    t.hstore   "style"
    t.hstore   "options"
    t.text     "fields"
  end

  create_table "layers", force: true do |t|
    t.string   "name"
    t.string   "file_uid"
    t.string   "file_name"
    t.boolean  "active"
    t.text     "legend"
    t.text     "style_old"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "popup"
    t.text     "options_old"
    t.hstore   "style"
    t.text     "fields"
    t.hstore   "options"
  end

  create_table "map_layers", force: true do |t|
    t.integer  "map_id"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layer_type"
  end

  create_table "maps", force: true do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",      default: false, null: false
  end

  create_table "wms_layers", force: true do |t|
    t.string   "url"
    t.string   "layers"
    t.text     "legend"
    t.boolean  "active",      default: true
    t.hstore   "options"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
