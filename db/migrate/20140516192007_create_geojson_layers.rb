class CreateGeojsonLayers < ActiveRecord::Migration
  def change
    create_table :geojson_layers do |t|
      t.string   "name"
      t.string   "file_uid"
      t.string   "file_name"
      t.boolean  "active", default: true
      t.text     "legend"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.text     "popup"
      t.hstore   "style"
      t.hstore   "options"
      t.text     "fields"
      t.timestamps
    end
  end
end
