# frozen_string_literal: true

class ReportImport < ApplicationRecord

  ####
  #### associations
  ####

  belongs_to :operator, class_name: 'User', foreign_key: :operator_id
  belongs_to :account
  has_one_attached :uploaded_file

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
  #### values
  ####

  attribute :status, default: -> { 'processing' }

  ####
  ####
  ####

end
