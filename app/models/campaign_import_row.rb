# frozen_string_literal: true

class CampaignImportRow
  ####
  #### accessors
  ####

  attr_accessor :xxx_product,
    :entity,
    :operation,
    :campaign_external_id,
    :ad_group_external_id,
    :portfolio_external_id,
    :ad_external_id,
    :keyword_external_id,
    :product_targeting_external_id,
    :campaign_name,
    :ad_group_name,
    :xxx_campaign_name_info,
    :xxx_ad_group_name_info,
    :portfolio_name,
    :start_date,
    :end_date,
    :targeting_type,
    :state,
    :campaign_state_info,
    :ad_group_state_info,
    :daily_budget,
    :daily_budget_in_cents,
    :sku,
    :asin,
    :eligibility_status_info,
    :reason_for_ineligibility_info,
    :ad_group_default_bid,
    :ad_group_default_bid_in_cents,
    :ad_group_default_bid_info,
    :bid,
    :bid_in_cents,
    :keyword_text,
    :match_type,
    :bidding_strategy,
    :placement,
    :percentage,
    :product_targeting_expression,
    :resolved_product_targeting_expression_info,
    :impressions,
    :clicks,
    :click_through_tate,
    :spend,
    :spend_in_cents,
    :sales,
    :sales_in_cents,
    :orders,
    :units,
    :conversation_rate,
    :acos,
    :cpc,
    :roas,
    :account_id,
    :taken_date

  ####
  #### constants
  ####

  KEYS_PUBLIC_TRANSFORMER = {
    "Product" => :xxx_product,
    "Entity" => :entity,
    "Operation" => :operation,
    "Campaign Id" => :campaign_external_id,
    "Ad Group Id" => :ad_group_external_id,
    "Portfolio Id" => :portfolio_external_id,
    "Ad Id (Read only)" => :ad_external_id,
    "Keyword Id (Read only)" => :keyword_external_id,
    "Product Targeting Id (Read only)" => :product_targeting_external_id,
    "Campaign Name" => :campaign_name,
    "Ad Group Name" => :ad_group_name,
    "Campaign Name (Informational only)" => :xxx_campaign_name_info,
    "Ad Group Name (Informational only)" => :xxx_ad_group_name_info,
    "Portfolio Name (Informational only)" => :portfolio_name,
    "Start Date" => :start_date,
    "End Date" => :end_date,
    "Targeting Type" => :targeting_type,
    "State" => :state,
    "Campaign State (Informational only)" => :campaign_state_info,
    "Ad Group State (Informational only)" => :ad_group_state_info,
    "Daily Budget" => :daily_budget,
    "SKU" => :sku,
    "ASIN (Informational only)" => :asin,
    "Eligibility Status (Informational only)" => :eligibility_status_info,
    "Reason for ineligibility (Informational only)" => :reason_for_ineligibility_info,
    "Ad Group Default Bid" => :ad_group_default_bid,
    "Ad Group Default Bid (Informational only)" => :ad_group_default_bid_info,
    "Bid" => :bid,
    "Keyword Text" => :keyword_text,
    "Match Type" => :match_type,
    "Bidding Strategy" => :bidding_strategy,
    "Placement" => :placement,
    "Percentage" => :percentage,
    "Product Targeting Expression" => :product_targeting_expression,
    "Resolved Product Targeting Expression (Informational only)" => :resolved_product_targeting_expression_info,
    "Impressions" => :impressions,
    "Clicks" => :clicks,
    "Click-through Rate" => :click_through_tate,
    "Spend" => :spend,
    "Sales" => :sales,
    "Orders" => :orders,
    "Units" => :units,
    "Conversion Rate" => :conversation_rate,
    "ACOS" => :acos,
    "CPC" => :cpc,
    "ROAS" => :roas
  }

  AD_GROUP_ATTRIBUTES = [
    :ad_group_external_id,
    :ad_group_name,
    :state,
    :ad_group_default_bid_in_cents,
  ]

  BIDDING_ADJUSTMENT_ATTRIBUTES = [
    :bidding_strategy,
    :placement,
    :percentage,
  ]

  CAMPAIGN_ATTRIBUTES = [
    :account_id,
    :campaign_external_id,
    :campaign_name,
    :portfolio_external_id,
    :portfolio_name,
    :start_date,
    :end_date,
    :targeting_type,
    :state,
    :daily_budget_in_cents,
    :bidding_strategy
  ]

  CAMPAIGN_METRIC_ATTRIBUTES = [
    :taken_date,
    :impressions,
    :clicks,
    :click_through_rate,
    :spend_in_cents,
    :sales_in_cents,
    :orders,
    :units,
    :conversation_rate,
    :acos,
    :cpc,
    :roas
  ]

  CAMPAIGN_NEGATIVE_KEYWORD_ATTRIBUTES = [
    :keyword_external_id,
    :state,
    :keyword_text,
    :match_type
  ]

  KEYWORD_ATTRIBUTES = [
    :keyword_external_id,
    :state,
    :bid_in_cents,
    :keyword_text,
    :match_type
  ]

  NEGATIVE_KEYWORD_ATTRIBUTES = [
    :keyword_external_id,
    :state,
    :keyword_text,
    :match_type
  ]

  PRODUCT_AD_ATTRIBUTES = [
    :ad_external_id,
    :state,
    :sku,
    :asin,
    :eligibility_status,
    :reason_for_eligibility
  ]

  PRODUCT_TARGETING_ATTRIBUTES = [
    :product_targeting_external_id,
    :state,
    :bid_in_cents,
    :expression,
    :resolved_expression
  ]

  NEGATIVE_PRODUCT_TARGETING_ATTRIBUTES = [
    :product_targeting_external_id,
    :state,
    :expression,
    :resolved_expression
  ]

  ####
  #### extensions
  ####

  include ActiveModel::Model

  ####
  ####
  ####

  def is_campaign?                   = entity == "Campaign"
  def is_bidding_adjustment?         = entity == "Bidding Adjustment"
  def is_ad_group?                   = entity == "Ad Group"
  def is_product_ad?                 = entity == "Product Ad"
  def is_keyword?                    = entity == "Keyword"
  def is_product_targeting?          = entity == "Product Targeting"
  def is_negative_keyword?           = entity == "Negative Keyword"
  def is_negative_product_targeting? = entity == "Negative Product Targeting"
  def is_campaign_negative_keyword?  = entity == "Campaign Negative Keyword"

  def ad_group_attributes
    formate_values
    instance_values.symbolize_keys.slice(*AD_GROUP_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def bidding_adjustment_attributes
    instance_values.symbolize_keys.slice(*BIDDING_ADJUSTMENT_ATTRIBUTES)
  end

  def campaign_attributes
    formate_values
    instance_values.symbolize_keys.slice(*CAMPAIGN_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def campaign_metric_attributes
    formate_values
    instance_values.symbolize_keys.slice(*CAMPAIGN_METRIC_ATTRIBUTES)
  end

  def campaign_negative_keyword_attributes
    instance_values.symbolize_keys.slice(*CAMPAIGN_NEGATIVE_KEYWORD_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def keyword_attributes
    formate_values
    instance_values.symbolize_keys.slice(*KEYWORD_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def negative_keyword_attributes
    instance_values.symbolize_keys.slice(*NEGATIVE_KEYWORD_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def product_ad_attributes
    instance_values.symbolize_keys.slice(*PRODUCT_AD_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def product_targeting_attributes
    formate_values
    instance_values.symbolize_keys.slice(*PRODUCT_TARGETING_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  def negative_product_targeting_attributes
    instance_values.symbolize_keys.slice(*NEGATIVE_PRODUCT_TARGETING_ATTRIBUTES).transform_keys!(KEYS_PRIVATE_TRANSFORMER)
  end

  private

  def ad_group_default_bid_in_cents!
    return unless ad_group_default_bid
    self.ad_group_default_bid_in_cents = ad_group_default_bid * 100
  end

  def bid_in_cents!
    return unless bid
    self.bid_in_cents = bid * 100
  end

  def daily_budget_in_cents!
    return unless daily_budget
    self.daily_budget_in_cents = daily_budget * 100
  end

  def formate_values
    daily_budget_in_cents!
    ad_group_default_bid_in_cents!
    bid_in_cents!
    spend_in_cents!
    sales_in_cents!
  end

  def spend_in_cents!
    return unless spend
    self.spend_in_cents = spend * 100
  end

  def sales_in_cents!
    return unless sales
    self.sales_in_cents = sales * 100
  end

  KEYS_PRIVATE_TRANSFORMER = {
    campaign_name: :name,
    campaign_external_id: :external_id,
    ad_group_name: :name,
    ad_group_external_id: :external_id,
    keyword_external_id: :external_id,
    ad_external_id: :external_id,
    product_targeting_external_id: :external_id
  }

end
