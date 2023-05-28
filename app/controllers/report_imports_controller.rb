# frozen_string_literal: true

class ReportImportsController < ApplicationController

  def new
    init_report_import
  end

  def create
    build_report_import
    persist_report_import
  end

  private

  def blod_identifier
    params.require(:report_import)[:uploaded_file]
  end

  def build_report_import
    @report_import = current_account.report_imports.new(report_import_params.except(:entity_id))
  end

  def current_account
    Account.find_by(entity_id: report_import_params[:entity_id])
  end

  def init_report_import
    @report_import = ReportImport.new
  end

  def persist_report_import
    begin
      if @report_import.save! && report_import_process_later
        redirect_to show_account_path(report_import_params[:entity_id])
      else
        #todo
      end
    rescue ActiveRecord::RecordNotUnique
      render 'new' #todo
    end
  end

  def report_import_process_later
    ReportImportProcessorJob.perform_async(@report_import.id)
  end

  def report_import_params
    enhanced_params = params.require(:report_import).permit(:entity_id, :uploaded_file)
    enhanced_params.merge!(operator_id: current_user.id)
    enhanced_params.merge!(taken_date: file_taken_date)
  end

  def file_taken_date
    # cause @report_import.uploaded_file doesn't exist yet.
    # filename should be integrate to the form as hidden_value (.js)
    filename = ActiveStorage::Blob.find_signed!(blod_identifier)[:filename]
    filename.split("-")[3]
  end
end

