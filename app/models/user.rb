# frozen_string_literal: true

class User < ApplicationRecord

  ####
  #### associations
  ####

  has_many :report_imports, foreign_key: :operator_id, dependent: :restrict_with_exception

  ####
  #### callbacks
  ####

  ####
  #### constants
  ####

  ####
  #### extensions
  ####

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable

  ####
  #### scopes
  ####

  ####
  ####
  ####

  def initials
    name.split(' ').map(&:chr).join
  end
end
