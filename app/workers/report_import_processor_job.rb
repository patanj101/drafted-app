# frozen_string_literal: true

class ReportImportProcessorJob
  include Sidekiq::Job
  sidekiq_options queue: 'low'

  def perform(report_import_id)
    report_import = ReportImport.find_by(id: report_import_id)
    ReportImportUploadedFileProcessor.call(report_import)
  end
end

