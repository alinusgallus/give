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

ActiveRecord::Schema.define(version: 20141023093858) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "available"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_pic_file_name"
    t.string   "item_pic_content_type"
    t.integer  "item_pic_file_size"
    t.datetime "item_pic_updated_at"
    t.integer  "category_id",           limit: 255
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id"
  add_index "items", ["user_id", "created_at"], name: "index_items_on_user_id_and_created_at"

  create_table "messages", force: true do |t|
    t.integer  "sender_id",  limit: 255
    t.string   "content"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "wishlists", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
