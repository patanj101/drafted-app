class CreateMarketplaces < ActiveRecord::Migration[7.0]
  def change
    create_table :marketplaces, id: :uuid do |t|
      t.column :name, :string, limit: 50, null: false
      t.column :url, :string, limit: 50, null: false
      t.references :currency, type: :uuid, null: false, foreign_key: true
      t.column :code, :string, limit: 2, null: false
      t.column :region, :string, limit: 50, null: false
      t.column :ext_identifier, :string, limit: 50, null: false
      t.column :tld, :string, limit: 6, null: false

      t.timestamps null: false

      t.index :code, unique: true, name: :index_marketplace_uniqueness
    end
  end
end



