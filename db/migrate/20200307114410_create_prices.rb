class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :customer, null: false, foreign_key: true
      t.decimal :price, default: 0

      t.timestamps
    end
  end
end
