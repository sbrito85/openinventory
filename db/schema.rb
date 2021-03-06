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

ActiveRecord::Schema.define(:version => 20130517200103) do

  create_table "assets", :force => true do |t|
    t.integer  "device_id"
    t.string   "serial"
    t.string   "asset"
    t.integer  "office_id"
    t.string   "assigned_to"
    t.string   "po_num"
    t.text     "comments"
    t.date     "acquired"
    t.date     "refresh"
    t.string   "machine_name"
    t.boolean  "disposed"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "client"
    t.integer  "person_id"
    t.string   "order_num"
  end

  add_index "assets", ["person_id"], :name => "index_assets_on_person_id"

  create_table "audits", :force => true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         :default => 0
    t.string   "comment"
    t.string   "remote_address"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], :name => "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], :name => "auditable_index"
  add_index "audits", ["created_at"], :name => "index_audits_on_created_at"
  add_index "audits", ["user_id", "user_type"], :name => "user_index"

  create_table "clients", :force => true do |t|
    t.string   "client"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "make"
    t.string   "model"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "assettype"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_remote_url"
  end

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.string   "dc"
    t.string   "dn"
    t.string   "adminUser"
    t.string   "adminPass"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "offices", :force => true do |t|
    t.string   "office"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "sitecode"
    t.integer  "domain_id"
    t.string   "ou"
  end

  add_index "offices", ["domain_id"], :name => "index_offices_on_domain_id"

  create_table "people", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "username"
    t.string   "department"
    t.string   "title"
    t.integer  "office_id"
    t.string   "telephone"
    t.string   "accountname"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "people", ["office_id"], :name => "index_people_on_office_id"

  create_table "rackitems", :force => true do |t|
    t.integer  "asset_id"
    t.integer  "unitsize"
    t.string   "position"
    t.string   "ipaddress"
    t.text     "comments"
    t.integer  "serverrack_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "rackasset"
  end

  add_index "rackitems", ["asset_id"], :name => "index_rackitems_on_asset_id"
  add_index "rackitems", ["serverrack_id"], :name => "index_rackitems_on_serverrack_id"

  create_table "serverracks", :force => true do |t|
    t.string   "name"
    t.integer  "totalunits"
    t.integer  "serverroom_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "serverracks", ["name"], :name => "index_serverracks_on_name"
  add_index "serverracks", ["serverroom_id"], :name => "index_serverracks_on_serverroom_id"

  create_table "serverrooms", :force => true do |t|
    t.string   "name"
    t.integer  "office_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "serverrooms", ["name"], :name => "index_serverrooms_on_name"
  add_index "serverrooms", ["office_id"], :name => "index_serverrooms_on_office_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "username",               :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
