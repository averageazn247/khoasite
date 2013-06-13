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

ActiveRecord::Schema.define(:version => 20130613190244) do

  create_table "attachments", :force => true do |t|
    t.string "filename"
    t.string "creater"
    t.string "title"
    t.binary "data"
  end

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "filename"
    t.string   "name"
    t.string   "title"
    t.binary   "data"
  end

  create_table "events", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
    t.string   "creator"
    t.date     "dayof"
    t.time     "start_time"
    t.text     "description"
    t.boolean  "phone"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "company"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "phone"
    t.string   "remember_token"
    t.string   "web"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "wordfiles", :force => true do |t|
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "word_file_name"
    t.string   "word_content_type"
    t.integer  "word_file_size"
  end

end
