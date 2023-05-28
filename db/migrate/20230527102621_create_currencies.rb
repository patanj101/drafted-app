class CreateCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.column :name, :string, limit: 50, null: false
      t.column :symbol, :string, limit: 3, null: false
      t.column :code, :string, limit: 3, null: false
      t.timestamps null: false

      t.index :code, unique: true, name: :index_currency_uniqueness
    end

  end
end



