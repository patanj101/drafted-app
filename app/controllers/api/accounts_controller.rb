# frozen_string_literal: true

module Api
  class AccountsController < ApplicationController
    before_action :force_json

    def index
      load_accounts
    end

    private

    def load_accounts
      @accounts = AccountQuery.call
    end

    def force_json
      request.format = :json
    end
  end
end
