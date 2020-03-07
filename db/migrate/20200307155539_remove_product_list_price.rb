class RemoveProductListPrice < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :list_price, :decimal
  end
end
