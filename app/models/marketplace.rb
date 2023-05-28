# frozen_string_literal: true

class Marketplace < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :currency
  has_many :accounts, dependent: :restrict_with_exception
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
