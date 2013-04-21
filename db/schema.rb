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

ActiveRecord::Schema.define(:version => 20130421133249) do

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
    t.string   "value"
    t.string   "schlib_part"
    t.string   "schlib_name"
  end

  create_table "components_supplier_skus", :id => false, :force => true do |t|
    t.integer "component_id"
    t.integer "supplier_sku_id"
  end

  add_index "components_supplier_skus", ["component_id", "supplier_sku_id"], :name => "comp_sku_index"
  add_index "components_supplier_skus", ["supplier_sku_id", "component_id"], :name => "sku_comp_index"

  create_table "kicadnetlists", :force => true do |t|
    t.datetime "date"
    t.string   "tool"
    t.string   "xml_file_name"
    t.string   "xml_content_type"
    t.integer  "xml_file_size"
    t.datetime "xml_updated_at"
    t.integer  "pcb_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "kicadnetlists", ["pcb_id"], :name => "index_kicadnetlists_on_pcb_id"

  create_table "octopart_query_caches", :force => true do |t|
    t.string   "query_hash",    :null => false
    t.text     "query"
    t.text     "json_result"
    t.integer  "http_response"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "octopart_query_caches", ["query_hash"], :name => "index_octopart_query_caches_on_query_hash"

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

  create_table "supplier_skus", :force => true do |t|
    t.string   "sku"
    t.integer  "moq"
    t.text     "prices"
    t.string   "product_url"
    t.integer  "in_stock_qty"
    t.integer  "on_order_qty"
    t.datetime "on_order_eta"
    t.integer  "factory_lead_days"
    t.integer  "factory_pack_quantity"
    t.integer  "order_multiple"
    t.string   "packaging"
    t.boolean  "is_authorized"
    t.datetime "last_updated"
    t.integer  "supplier_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "supplier_skus", ["supplier_id"], :name => "index_supplier_skus_on_supplier_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
