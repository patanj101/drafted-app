class CreateCampaignsTables < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns, id: :uuid do |t|
      t.references :account, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :name, limit:  100, null: false
      t.string :name_info, limit: 100, null: true
      t.bigint :portfolio_external_id, null: true
      t.string :portfolio_name, limit:  50, null: true
      t.datetime :start_date, null: false
      t.datetime :end_date, null: true
      t.string :targeting_type, limit:  50, null: false
      t.string :state, limit:  50, null: false
      t.integer :daily_budget_in_cents, null: false
      t.string :bidding_strategy, limit:  50, null: false

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_campaigns_uniqueness
    end

    create_table :ad_groups, id: :uuid do |t|
      t.references :campaign, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :name, limit:  100, null: false
      t.string :state, limit:  50, null: false
      t.integer :ad_group_default_bid_in_cents, null: false

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_ad_groups_uniqueness
    end

    create_table :bidding_adjustments, id: :uuid do |t|
      t.references :campaign, type: :uuid, null: false, foreign_key: true

      t.string :bidding_strategy, limit:  50, null: false
      t.string :placement, limit: 100, null: true
      t.float :percentage, null: true

      t.timestamps null: false

      t.index [:campaign_id, :bidding_strategy, :placement], unique: true, name: :index_bidding_adjustments_uniqueness
    end

    create_table :campaign_negative_keywords, id: :uuid do |t|
      t.references :campaign, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.string :keyword_text, limit: 100, null: false
      t.string :match_type, limit:  50, null: false

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_campaign_negative_keywords_uniqueness
    end

    create_table :keywords, id: :uuid do |t|
      t.references :ad_group, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.integer :bid_in_cents, null: true
      t.string :keyword_text, limit: 100, null: false
      t.string :match_type, limit:  50, null: false

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_keywords_uniqueness
    end

    create_table :negative_keywords, id: :uuid do |t|
      t.references :ad_group, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.string :keyword_text, limit: 100, null: false
      t.string :match_type, limit:  50, null: false

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_negative_keywords_uniqueness
    end

    create_table :product_ads, id: :uuid do |t|
      t.references :ad_group, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.string :sku, limit: 50, null: true
      t.string :asin, limit:  50, null: true
      t.string :eligibility_status, limit:  50, null: true
      t.string :reason_for_eligibility, limit:  100, null: true

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_product_ads_uniqueness
    end

    create_table :product_targetings, id: :uuid do |t|
      t.references :ad_group, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.integer :bid_in_cents, null: true
      t.string :expression, limit: 50, null: true
      t.string :resolved_expression, limit:  50, null: true

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_product_targetings_uniqueness
    end

    create_table :negative_product_targetings, id: :uuid do |t|
      t.references :ad_group, type: :uuid, null: false, foreign_key: true

      t.bigint :external_id, null: false
      t.string :state, limit:  50, null: false
      t.string :expression, limit: 50, null: true
      t.string :resolved_expression, limit:  50, null: true

      t.timestamps null: false

      t.index :external_id, unique: true, name: :index_negative_product_targetings_uniqueness
    end

    create_table :campaign_metrics, id: :uuid do |t|
      t.belongs_to :metricable, type: :uuid, polymorphic: true, null: false, index: {name: :index_campaign_metrics_contactable}

      t.datetime :taken_date, null: false
      t.integer :impressions, null: false
      t.integer :clicks, null: false
      t.float   :click_through_rate, null: false, default: 0
      t.integer :spend_in_cents, null: false
      t.integer :sales_in_cents, null: false
      t.integer :orders, null: false
      t.integer :units, null: false
      t.float   :conversation_rate, null: false
      t.float   :acos, null: false
      t.float   :cpc, null: false
      t.float   :roas, null: false

      t.timestamps null: false

      t.index [ :metricable_type, :metricable_id, :taken_date ], unique: true, name: :index_campaign_metrics_uniqueness
    end
  end
end

