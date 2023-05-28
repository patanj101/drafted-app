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

ActiveRecord::Schema[7.0].define(version: 2023_05_27_102625) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.uuid "marketplace_id", null: false
    t.string "entity_id", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_id"], name: "index_accounts_uniqueness", unique: true
    t.index ["marketplace_id"], name: "index_accounts_on_marketplace_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "ad_groups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "campaign_id", null: false
    t.bigint "external_id", null: false
    t.string "name", limit: 100, null: false
    t.string "state", limit: 50, null: false
    t.integer "ad_group_default_bid_in_cents", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_ad_groups_on_campaign_id"
    t.index ["external_id"], name: "index_ad_groups_uniqueness", unique: true
  end

  create_table "bidding_adjustments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "campaign_id", null: false
    t.string "bidding_strategy", limit: 50, null: false
    t.string "placement", limit: 100
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id", "bidding_strategy", "placement"], name: "index_bidding_adjustments_uniqueness", unique: true
    t.index ["campaign_id"], name: "index_bidding_adjustments_on_campaign_id"
  end

  create_table "campaign_metrics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "metricable_type", null: false
    t.uuid "metricable_id", null: false
    t.datetime "taken_date", null: false
    t.integer "impressions", null: false
    t.integer "clicks", null: false
    t.float "click_through_rate", default: 0.0, null: false
    t.integer "spend_in_cents", null: false
    t.integer "sales_in_cents", null: false
    t.integer "orders", null: false
    t.integer "units", null: false
    t.float "conversation_rate", null: false
    t.float "acos", null: false
    t.float "cpc", null: false
    t.float "roas", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["metricable_type", "metricable_id", "taken_date"], name: "index_campaign_metrics_uniqueness", unique: true
    t.index ["metricable_type", "metricable_id"], name: "index_campaign_metrics_contactable"
  end

  create_table "campaign_negative_keywords", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "campaign_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.string "keyword_text", limit: 100, null: false
    t.string "match_type", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_negative_keywords_on_campaign_id"
    t.index ["external_id"], name: "index_campaign_negative_keywords_uniqueness", unique: true
  end

  create_table "campaigns", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.bigint "external_id", null: false
    t.string "name", limit: 100, null: false
    t.string "name_info", limit: 100
    t.bigint "portfolio_external_id"
    t.string "portfolio_name", limit: 50
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.string "targeting_type", limit: 50, null: false
    t.string "state", limit: 50, null: false
    t.integer "daily_budget_in_cents", null: false
    t.string "bidding_strategy", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_campaigns_on_account_id"
    t.index ["external_id"], name: "index_campaigns_uniqueness", unique: true
  end

  create_table "currencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "symbol", limit: 3, null: false
    t.string "code", limit: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_currency_uniqueness", unique: true
  end

  create_table "keywords", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ad_group_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.integer "bid_in_cents"
    t.string "keyword_text", limit: 100, null: false
    t.string "match_type", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_group_id"], name: "index_keywords_on_ad_group_id"
    t.index ["external_id"], name: "index_keywords_uniqueness", unique: true
  end

  create_table "marketplaces", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.string "url", limit: 50, null: false
    t.uuid "currency_id", null: false
    t.string "code", limit: 2, null: false
    t.string "region", limit: 50, null: false
    t.string "ext_identifier", limit: 50, null: false
    t.string "tld", limit: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_marketplace_uniqueness", unique: true
    t.index ["currency_id"], name: "index_marketplaces_on_currency_id"
  end

  create_table "negative_keywords", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ad_group_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.string "keyword_text", limit: 100, null: false
    t.string "match_type", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_group_id"], name: "index_negative_keywords_on_ad_group_id"
    t.index ["external_id"], name: "index_negative_keywords_uniqueness", unique: true
  end

  create_table "negative_product_targetings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ad_group_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.string "expression", limit: 50
    t.string "resolved_expression", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_group_id"], name: "index_negative_product_targetings_on_ad_group_id"
    t.index ["external_id"], name: "index_negative_product_targetings_uniqueness", unique: true
  end

  create_table "product_ads", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ad_group_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.string "sku", limit: 50
    t.string "asin", limit: 50
    t.string "eligibility_status", limit: 50
    t.string "reason_for_eligibility", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_group_id"], name: "index_product_ads_on_ad_group_id"
    t.index ["external_id"], name: "index_product_ads_uniqueness", unique: true
  end

  create_table "product_targetings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "ad_group_id", null: false
    t.bigint "external_id", null: false
    t.string "state", limit: 50, null: false
    t.integer "bid_in_cents"
    t.string "expression", limit: 50
    t.string "resolved_expression", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ad_group_id"], name: "index_product_targetings_on_ad_group_id"
    t.index ["external_id"], name: "index_product_targetings_uniqueness", unique: true
  end

  create_table "report_imports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id", null: false
    t.uuid "operator_id", null: false
    t.datetime "taken_date", null: false
    t.string "status", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "taken_date"], name: "index_report_imports_uniqueness", unique: true
    t.index ["account_id"], name: "index_report_imports_on_account_id"
    t.index ["operator_id"], name: "index_report_imports_on_operator_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "google_user_id"
    t.string "name", limit: 50, null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email", "google_user_id"], name: "index_user_uniqueness", unique: true
  end

  add_foreign_key "accounts", "marketplaces"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ad_groups", "campaigns"
  add_foreign_key "bidding_adjustments", "campaigns"
  add_foreign_key "campaign_negative_keywords", "campaigns"
  add_foreign_key "campaigns", "accounts"
  add_foreign_key "keywords", "ad_groups"
  add_foreign_key "marketplaces", "currencies"
  add_foreign_key "negative_keywords", "ad_groups"
  add_foreign_key "negative_product_targetings", "ad_groups"
  add_foreign_key "product_ads", "ad_groups"
  add_foreign_key "product_targetings", "ad_groups"
  add_foreign_key "report_imports", "accounts"
  add_foreign_key "report_imports", "users", column: "operator_id"
end
