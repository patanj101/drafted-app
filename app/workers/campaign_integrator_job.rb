# frozen_string_literal: true

class CampaignIntegratorJob
  include Sidekiq::Job
  sidekiq_options queue: 'low'

  def perform(campaign_import_attributes)
    campaign_import_row = CampaignImportRow.new(json_to_hash(campaign_import_attributes))
    CampaignRowCreator.call(campaign_import_row)
  end

  private

  def json_to_hash(json)
    JSON.parse(json).transform_keys(&:to_sym)
  end
end

