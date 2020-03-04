class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number 
      t.belongs_to :customer, null: false, foreign_key: true
      t.date :delivered_at
      t.decimal :receivable
      t.decimal :paid

      t.timestamps
    end
    add_index :orders, :delivered_at
    add_index :orders, :number, unique: true
  end
end
