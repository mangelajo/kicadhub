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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130420170721) do

  create_table "assembly_guides", :force => true do |t|
    t.string   "description"
    t.integer  "pcb_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "assembly_guides", ["pcb_id"], :name => "index_assembly_guides_on_pcb_id"

  create_table "assembly_steps", :force => true do |t|
    t.string   "name"
    t.integer  "assembly_guide_id"
    t.integer  "reference_id"
    t.integer  "index"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
  end

  add_index "assembly_steps", ["assembly_guide_id"], :name => "index_assembly_steps_on_assembly_guide_id"
  add_index "assembly_steps", ["reference_id"], :name => "index_assembly_steps_on_reference_id"

  create_table "components", :force => true do |t|
    t.string   "name"
    t.string   "manufacturer"
    t.string   "footprint"
    t.text     "description"
    t.string   "datasheet_url"
    t.string   "manufacturer_cmp_url"
    t.string   "mpn"
    t.string   "octopart_uid"
    t.string   "octopart_url"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "kicadnetlists", :force => true do |t|
    t.datetime "date"
    t.string   "tool"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "pcbs", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
  end

  create_table "reference_prints", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "assembly_guide_id"
    t.integer  "reference_id"
    t.integer  "index"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.string   "preview_file_name"
    t.string   "preview_content_type"
    t.integer  "preview_file_size"
    t.datetime "preview_updated_at"
  end

  add_index "reference_prints", ["assembly_guide_id"], :name => "index_reference_prints_on_assembly_guide_id"
  add_index "reference_prints", ["reference_id"], :name => "index_reference_prints_on_reference_id"

  create_table "references", :force => true do |t|
    t.string   "name"
    t.integer  "kicadnetlist_id"
    t.integer  "component_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "references", ["component_id"], :name => "index_references_on_component_id"
  add_index "references", ["kicadnetlist_id"], :name => "index_references_on_kicadnetlist_id"

end
