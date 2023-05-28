# frozen_string_literal: true

class AccountsController < ApplicationController

  def index; end

  def new
    init_account
  end

  def create
    build_account
    persist_account
  end

  def show
    load_account
  end

  def destroy
    load_account
    destroy_account
  end

  private

  def account_params
    params.require(:account).permit(:name, :marketplace_code, :entity_id)
  end

  def build_account
    @account = marketplace.accounts.new(account_params.except(:marketplace_code))
  end

  def init_account
    @account = Account.new
  end

  def load_account
    @account = AccountQuery.call.find_by(entity_id: params[:entity_id])
  end

  def marketplace
    Marketplace.find_by(code: account_params[:marketplace_code])
  end

  def destroy_account
    if @account.delete
      render_accounts
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def persist_account
    if @account.save
      render_accounts
    else
      render :new, status: :unprocessable_entity
    end
  end

  def render_accounts
    redirect_to index_accounts_path
  end

end

