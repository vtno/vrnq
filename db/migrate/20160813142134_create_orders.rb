class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :shipping_cost
      t.decimal :packaging_cost
      t.string :buyer_name

      t.timestamps null: false
    end
  end
end
