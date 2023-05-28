class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts, id: :uuid do |t|
      t.column :name, :string, limit: 50, null: false
      t.references :marketplace, type: :uuid, null: false, foreign_key: true
      t.column :entity_id, :string, limit: 50, null: false

      t.timestamps null: false

      t.index :entity_id, unique: true, name: :index_accounts_uniqueness
    end
  end
end
