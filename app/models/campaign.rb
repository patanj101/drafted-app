# frozen_string_literal: true

class Campaign < ApplicationRecord

  ####
  #### associations
  ####

  has_many :bidding_adjustments, dependent: :restrict_with_exception
  has_many :ad_groups, dependent: :restrict_with_exception
  has_many :campaign_negative_keywords, dependent: :restrict_with_exception
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
