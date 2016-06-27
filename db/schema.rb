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

ActiveRecord::Schema.define(version: 20160621042538) do

  create_table "budgets", force: :cascade do |t|
    t.string   "budgetrange"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fund_cat_as", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fund_cat_bs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funders", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "logos", force: :cascade do |t|
    t.binary   "data",            null: false
    t.string   "name",            null: false
    t.string   "filename"
    t.string   "mime_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "logos", ["organization_id"], name: "index_logos_on_organization_id"

  create_table "org_statuses", force: :cascade do |t|
    t.string   "orgStatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "org_web_urls", force: :cascade do |t|
    t.string   "type"
    t.string   "url"
    t.integer  "organization_id"
    t.integer  "social_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "org_web_urls", ["organization_id"], name: "index_org_web_urls_on_organization_id"
  add_index "org_web_urls", ["social_type_id"], name: "index_org_web_urls_on_social_type_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "descrip"
    t.text     "mission"
    t.text     "address"
    t.integer  "logo_id"
    t.integer  "paos_id"
    t.integer  "budget_id"
    t.integer  "funder_id"
    t.integer  "staffsize_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "organizations", ["budget_id"], name: "index_organizations_on_budget_id"
  add_index "organizations", ["funder_id"], name: "index_organizations_on_funder_id"
  add_index "organizations", ["logo_id"], name: "index_organizations_on_logo_id"
  add_index "organizations", ["paos_id"], name: "index_organizations_on_paos_id"
  add_index "organizations", ["staffsize_id"], name: "index_organizations_on_staffsize_id"

  create_table "p_ao_s", force: :cascade do |t|
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_types", force: :cascade do |t|
    t.string   "socType"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staff_sizes", force: :cascade do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
