# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2024_11_21_023241) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "cloud_providers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "credential_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credential_id"], name: "index_cloud_providers_on_credential_id"
  end

  create_table "credentials", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dns_records", force: :cascade do |t|
    t.string "description"
    t.string "dns_server"
    t.bigint "server_id", null: false
    t.bigint "fully_qualified_domain_name_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fully_qualified_domain_name_id"], name: "index_dns_records_on_fully_qualified_domain_name_id"
    t.index ["server_id"], name: "index_dns_records_on_server_id"
  end

  create_table "domain_names", force: :cascade do |t|
    t.string "name"
    t.string "registrar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fully_qualified_domain_names", force: :cascade do |t|
    t.string "hostname"
    t.bigint "domain_name_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["domain_name_id"], name: "index_fully_qualified_domain_names_on_domain_name_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "hostname"
    t.string "description"
    t.bigint "fully_qualified_domain_name_id", null: false
    t.bigint "credential_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["credential_id"], name: "index_servers_on_credential_id"
    t.index ["fully_qualified_domain_name_id"], name: "index_servers_on_fully_qualified_domain_name_id"
  end

  add_foreign_key "cloud_providers", "credentials"
  add_foreign_key "dns_records", "fully_qualified_domain_names"
  add_foreign_key "dns_records", "servers"
  add_foreign_key "fully_qualified_domain_names", "domain_names"
  add_foreign_key "servers", "credentials"
  add_foreign_key "servers", "fully_qualified_domain_names"
end
