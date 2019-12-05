class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.text :feedback
      t.string :brand
      t.string :country
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
