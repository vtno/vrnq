class AddAmountToOrderProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :order_products, :amount, :integer
  end
end
