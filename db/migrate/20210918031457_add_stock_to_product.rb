class AddStockToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :stock, :string
  end
end