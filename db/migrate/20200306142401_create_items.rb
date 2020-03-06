class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.belongs_to :order, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :unit
      t.decimal :price
      t.integer :total_quantity
      t.decimal :total_price
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :items, :deleted_at
  end
end
