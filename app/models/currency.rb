# frozen_string_literal: true

class Currency < ApplicationRecord

  ####
  #### associations
  ####

  has_many :marketplaces, dependent: :restrict_with_exception

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
