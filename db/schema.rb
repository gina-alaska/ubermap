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

ActiveRecord::Schema.define(version: 20170315005524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "geojson_layers", force: :cascade do |t|
    t.string   "name"
    t.string   "file_uid"
    t.string   "file_name"
    t.boolean  "active",            default: true
    t.text     "legend"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "popup"
    t.hstore   "style"
    t.hstore   "options"
    t.text     "fields"
    t.integer  "organization_id"
    t.string   "file_id"
    t.integer  "file_size"
    t.string   "file_filename"
    t.string   "file_content_type"
  end

  add_index "geojson_layers", ["organization_id"], name: "index_geojson_layers_on_organization_id", using: :btree

  create_table "map_layers", force: :cascade do |t|
    t.integer  "map_id"
    t.integer  "layer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "layer_type"
  end

  create_table "maps", force: :cascade do |t|
    t.string   "title"
    t.string   "slug"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "maps", ["organization_id"], name: "index_maps_on_organization_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "multimap_maps", force: :cascade do |t|
    t.integer  "multimap_id"
    t.integer  "map_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "active",      default: true
  end

  add_index "multimap_maps", ["map_id"], name: "index_multimap_maps_on_map_id", using: :btree
  add_index "multimap_maps", ["multimap_id"], name: "index_multimap_maps_on_multimap_id", using: :btree

  create_table "multimaps", force: :cascade do |t|
    t.string   "name"
    t.boolean  "active",          default: true
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "slug"
    t.integer  "organization_id"
  end

  add_index "multimaps", ["organization_id"], name: "index_multimaps_on_organization_id", using: :btree
  add_index "multimaps", ["slug"], name: "index_multimaps_on_slug", unique: true, using: :btree
  add_index "multimaps", ["user_id"], name: "index_multimaps_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
  end

  add_index "organizations", ["slug"], name: "index_organizations_on_slug", unique: true, using: :btree

  create_table "organizations_users", force: :cascade do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "organizations_users", ["organization_id"], name: "index_organizations_users_on_organization_id", using: :btree
  add_index "organizations_users", ["user_id"], name: "index_organizations_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false, null: false
    t.integer  "organization_id"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree

  create_table "wms_layers", force: :cascade do |t|
    t.string   "url"
    t.string   "layers"
    t.text     "legend"
    t.boolean  "active",          default: true
    t.hstore   "options"
    t.text     "description"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "wms_layers", ["organization_id"], name: "index_wms_layers_on_organization_id", using: :btree

  add_foreign_key "geojson_layers", "organizations"
  add_foreign_key "maps", "organizations"
  add_foreign_key "multimap_maps", "maps"
  add_foreign_key "multimap_maps", "multimaps"
  add_foreign_key "multimaps", "organizations"
  add_foreign_key "multimaps", "users"
  add_foreign_key "organizations_users", "organizations"
  add_foreign_key "organizations_users", "users"
  add_foreign_key "users", "organizations"
  add_foreign_key "wms_layers", "organizations"
end
