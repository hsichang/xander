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

ActiveRecord::Schema.define(:version => 20140610041033) do

  create_table "posts", :force => true do |t|
    t.text    "body",                        :null => false
    t.integer "title_id"
    t.integer "order",    :default => 100,   :null => false
    t.boolean "visible",  :default => true,  :null => false
    t.boolean "deleted",  :default => false, :null => false
  end

  create_table "titles", :force => true do |t|
    t.string   "name",                          :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "order",      :default => 100,   :null => false
    t.boolean  "visible",    :default => true,  :null => false
    t.boolean  "deleted",    :default => false, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                         :null => false
    t.string   "password_hash"
    t.string   "email_address",                    :null => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "uuid"
    t.boolean  "superuser",     :default => false, :null => false
    t.boolean  "active",        :default => false, :null => false
  end

  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
