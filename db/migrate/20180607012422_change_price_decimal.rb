class ChangePriceDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :price, "numeric using CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
