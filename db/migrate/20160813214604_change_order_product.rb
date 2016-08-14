class ChangeOrderProduct < ActiveRecord::Migration
  def change
    remove_column :order_products, :total_cost, :decimal
    remove_column :order_products, :total_price, :decimal
    add_column :order_products, :order_id, :integer
    add_column :order_products, :product_id, :integer

    add_column :orders, :total_price, :decimal
    add_column :orders, :total_cost, :decimal
    add_column :orders, :discount, :decimal
    add_column :orders, :full_price, :decimal
  end
end
