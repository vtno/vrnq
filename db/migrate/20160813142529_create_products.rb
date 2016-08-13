class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.decimal :cost

      t.timestamps null: false
    end
  end
end
