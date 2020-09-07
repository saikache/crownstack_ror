class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :buying_quantity, default: 1
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
