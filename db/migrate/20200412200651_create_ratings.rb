class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :rating
      t.integer :menu_item_id
      # t.integer :restaurant_id
      t.integer :user_id
    end
  end
end
