# frozen_string_literal: true

class CampaignMetric < ApplicationRecord
  ####
  #### associations
  ####

  belongs_to :metricable, polymorphic: true

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
  #### validations
  ####

  ####
  ####
  ####

  private

  ####
  #### private
  ####

end
