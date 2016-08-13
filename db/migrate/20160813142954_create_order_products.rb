class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :amount
      t.decimal :total_cost
      t.decimal :total_price

      t.timestamps null: false
    end
  end
end
