# frozen_string_literal: true

class ReportImportUploadedFileProcessor < ApplicationService
  def initialize(report_import)
    @report_import = report_import
  end

  def call
    return false unless processable

    process
  end

  private

  def processable
    @report_import.present?
  end

  def process
    sheet.drop(1).each do |row|
      temp_attributes = [sheet_translated_header, row].transpose.to_h
      campaign_import_attributes = temp_attributes.merge(report_import_params)

      CampaignIntegratorJob.perform_async(campaign_import_attributes.to_json)
    end
  end

  def report_import_params
    @report_import.slice(:account_id, :taken_date)
  end

  def sheet
    @sheet ||= xlsx.sheet('Sponsored Products Campaigns')
  end

  def sheet_translated_header
    sheet_header = sheet.row(1)
    sheet_header.to_h {|i| [i, nil]}.transform_keys!(CampaignImportRow::KEYS_PUBLIC_TRANSFORMER).keys
  end

  def xlsx
    @report_import.uploaded_file.open do |tempfile|
      Roo::Spreadsheet.open(tempfile)
    end
  end
end
