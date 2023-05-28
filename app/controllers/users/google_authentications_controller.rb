# frozen_string_literal: true

module Users
  class GoogleAuthenticationsController < ApplicationController

    def create
      build_google_identity
      authenticate_with_google
      build_user_with_google
      persist_session
    end

    private

    def authenticate_with_google
      @google_identity.hosted_domain == "draftedcommerce.com" &&
        @google_identity.email_verified?
    end

    def build_google_identity
      @google_identity = GoogleSignIn::Identity.new(id_token)
    end

    def build_user_with_google
      @user = User.find_or_create_by(user_params)
    end

    def draftedcommerce_employee
      google_identity.hosted_domain == "draftedcommerce.com" &&
        google_identity.email_verified?
    end

    def id_token = flash[:google_sign_in]["id_token"]

    def persist_session
      if sign_in(@user)
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end

    def user_params
      { google_user_id: @google_identity.user_id, name: @google_identity.name }
    end
  end
end
