class CreateShoes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoes do |t|
      t.string :brand
      t.string :model
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
