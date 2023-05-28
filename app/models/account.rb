# frozen_string_literal: true

class Account < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :marketplace
  has_many :report_imports, dependent: :restrict_with_exception

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

  validates :entity_id, presence: true, length: { in: 3..50 }

  ####
  ####
  ####

  def external_amazon_url
    "https://advertising.amazon." + marketplace.tld + "/bulksheet/HomePage?entityId=" + entity_id
  end

  def full_name
    name + " - " + marketplace.code
  end
end
