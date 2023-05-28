# frozen_string_literal: true

class NegativeProductTargeting < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :ad_group
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
