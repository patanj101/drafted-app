# frozen_string_literal: true

class AdGroup < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :campaign
  has_many :keywords, dependent: :restrict_with_exception
  has_many :negative_keywords, dependent: :restrict_with_exception
  has_many :product_ads, dependent: :restrict_with_exception
  has_many :product_targetings, dependent: :restrict_with_exception
  has_many :negative_product_targetings, dependent: :restrict_with_exception
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
