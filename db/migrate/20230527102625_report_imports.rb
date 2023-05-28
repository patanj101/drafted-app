class ReportImports < ActiveRecord::Migration[7.0]
  def change
    create_table :report_imports, id: :uuid do |t|
      t.references :account, type: :uuid, null: false, foreign_key: true
      t.references :operator, type: :uuid, null: false, foreign_key: {to_table: :users}

      t.datetime :taken_date, null: false
      t.string :status, limit: 20, null: false

      t.timestamps null: false

      t.index [ :account_id, :taken_date ], unique: true, name: :index_report_imports_uniqueness
    end
  end
end

