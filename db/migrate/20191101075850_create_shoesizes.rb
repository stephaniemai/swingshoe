class CreateShoesizes < ActiveRecord::Migration[5.2]
  def change
    create_table :shoesizes do |t|
      t.integer :size
      t.boolean :stock
      t.references :shoe, foreign_key: true

      t.timestamps
    end
  end
end
