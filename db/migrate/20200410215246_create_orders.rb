class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :menu_item_id
      t.integer :quantity
      t.integer :order_total
      t.integer :cart_id
    end
  end
end
