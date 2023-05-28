# frozen_string_literal: true

class CampaignNegativeKeyword < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :campaign
  has_many :campaign_metrics, as: :metricable, dependent: :restrict_with_exception

  ####
  #### callbacks
  ####

  ####
  #### constants
  ####

  ####
  #### extensions
  ####

  ####
  #### scopes
  ####

  ####
  ####
  ####

end
