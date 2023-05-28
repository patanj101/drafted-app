# frozen_string_literal: true

class CampaignRowCreator < ApplicationService
  def initialize(campaign_import_row)
    @campaign_import_row = campaign_import_row
    @campaign_object = nil
  end

  def call
    return false unless processable

    process
  end

  private

  ###
  ### belongs_to :campaign
  ###

  def import_campaign
    @campaign_object = Campaign.find_or_create_by!(@campaign_import_row.campaign_attributes)
  end

  def import_ad_group
    campaign = Campaign.find_by(external_id: @campaign_import_row.campaign_external_id)
    ad_group = campaign.ad_groups.new(@campaign_import_row.ad_group_attributes)
    @campaign_object = AdGroup.find_or_create_by!(ad_group.attributes.except("id","created_at","updated_at"))
  end

  def import_bidding_adjustment
    campaign = Campaign.find_by(external_id: @campaign_import_row.campaign_external_id)
    bidding_adjustment = campaign.bidding_adjustments.new(@campaign_import_row.bidding_adjustment_attributes)
    @campaign_object = BiddingAdjustment.find_or_create_by!(bidding_adjustment.attributes.except("id","created_at","updated_at"))
  end

  ###
  ### belongs_to :ad_group
  ###

  def import_campaign_negative_keyword
    campaign = Campaign.find_by(external_id: @campaign_import_row.campaign_external_id)
    campaign_negative_keyword = campaign.campaign_negative_keywords.new(@campaign_import_row.campaign_negative_keyword_attributes)
    @campaign_object = CampaignNegativeKeyword.find_or_create_by!(campaign_negative_keyword.attributes.except("id","created_at","updated_at"))
  end

  def import_keyword
    ad_group = AdGroup.find_by(external_id: @campaign_import_row.ad_group_external_id)
    keyword = ad_group.keywords.new(@campaign_import_row.keyword_attributes)
    @campaign_object = Keyword.find_or_create_by!(keyword.attributes.except("id","created_at","updated_at"))
  end

  def import_negative_keyword
    ad_group = AdGroup.find_by(external_id: @campaign_import_row.ad_group_external_id)
    negative_keyword = ad_group.negative_keywords.new(@campaign_import_row.negative_keyword_attributes)
    @campaign_object = NegativeKeyword.find_or_create_by!(negative_keyword.attributes.except("id","created_at","updated_at"))
  end

  def import_product_ad
    ad_group = AdGroup.find_by(external_id: @campaign_import_row.ad_group_external_id)
    product_ad = ad_group.product_ads.new(@campaign_import_row.product_ad_attributes)
    @campaign_object = ProductAd.find_or_create_by!(product_ad.attributes.except("id","created_at","updated_at"))
  end

  def import_product_targeting
    ad_group = AdGroup.find_by(external_id: @campaign_import_row.ad_group_external_id)
    product_targeting = ad_group.product_targetings.new(@campaign_import_row.product_targeting_attributes)
    @campaign_object = ProductTargeting.find_or_create_by!(product_targeting.attributes.except("id","created_at","updated_at"))
  end

  def import_negative_product_targeting
    ad_group = AdGroup.find_by(external_id: @campaign_import_row.ad_group_external_id)
    negative_product_targeting = ad_group.negative_product_targetings.new(@campaign_import_row.negative_product_targeting_attributes)
    @campaign_object = NegativeProductTargeting.find_or_create_by!(negative_product_targeting.attributes.except("id","created_at","updated_at"))
  end

  def processable
    @campaign_import_row.present?
  end

  def process
    process_campaign_object
    process_campaign_metric
  end

  def process_campaign_object
    import_campaign                   if @campaign_import_row.is_campaign?
    import_ad_group                   if @campaign_import_row.is_ad_group?
    import_bidding_adjustment         if @campaign_import_row.is_bidding_adjustment?
    import_campaign_negative_keyword  if @campaign_import_row.is_campaign_negative_keyword?
    import_keyword                    if @campaign_import_row.is_keyword?
    import_negative_keyword           if @campaign_import_row.is_negative_keyword?
    import_product_ad                 if @campaign_import_row.is_product_ad?
    import_product_targeting          if @campaign_import_row.is_product_targeting?
    import_negative_product_targeting if @campaign_import_row.is_negative_product_targeting?
  end

  def process_campaign_metric
    campaign_metric = @campaign_object.campaign_metrics.new(@campaign_import_row.campaign_metric_attributes)
    CampaignMetric.find_or_create_by!(campaign_metric.attributes.except("id","created_at","updated_at"))
  end
end
