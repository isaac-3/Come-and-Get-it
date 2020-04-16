class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :ingredient_id
      t.integer :restaurant_id
    end
  end
end
