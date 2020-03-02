class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :tel
      t.string :address
      t.text :note
      t.boolean :cash_payment, default: false
      t.boolean :close_day_at_25th, default: false
      t.belongs_to :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
