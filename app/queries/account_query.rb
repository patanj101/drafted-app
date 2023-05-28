# frozen_string_literal: true

  class AccountQuery < ApplicationQuery
    def initialize(relation = Account.all)
      @relation = relation
    end

    def call
      result = @relation.eager_load(*associations)
    end

    private

    def associations
      %i[marketplace report_imports]
      # .push({ report_imports: [:uploaded_file] })
    end
  end
