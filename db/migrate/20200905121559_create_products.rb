class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.float :price
      t.integer :make
      t.integer :available_quantity

      t.timestamps
    end
  end
end
