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

ActiveRecord::Schema.define(version: 2018_02_26_073252) do

  create_table "municipalities", primary_key: "code", id: :string, limit: 6, force: :cascade do |t|
    t.string "prefecture_code", limit: 2, null: false
    t.string "district_name"
    t.string "name"
    t.string "district_kana"
    t.string "kana"
    t.string "district_name_e"
    t.string "name_e"
    t.index ["prefecture_code"], name: "index_municipalities_on_prefecture_code"
  end

end
