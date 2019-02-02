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

ActiveRecord::Schema.define(version: 2019_02_02_092058) do

  create_table "stocks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "stock_code"
    t.string "stock_name"
    t.integer "registered_year"
    t.integer "registered_month"
    t.float "per"
    t.float "pbr"
    t.float "capital_adequacy_ratio"
    t.integer "last_year_sales"
    t.integer "this_year_sales"
    t.integer "next_year_sales"
    t.integer "last_year_sales_profit"
    t.integer "this_year_sales_profit"
    t.integer "next_year_sales_profit"
    t.integer "last_year_net_profit"
    t.integer "this_year_net_profit"
    t.integer "next_year_net_profit"
    t.float "last_year_eps"
    t.float "this_year_eps"
    t.float "next_year_eps"
    t.float "last_year_dividend"
    t.float "this_year_dividend"
    t.float "next_year_dividend"
    t.float "this_year_dividend_yield"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
