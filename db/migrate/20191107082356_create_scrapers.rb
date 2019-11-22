class CreateScrapers < ActiveRecord::Migration[5.2]
  def change
    create_table :scrapers do |t|
      t.string :brand
      t.string :shoe_list_url
      t.string :scraper_description
      t.string :links
      t.string :host
      t.string :model
      t.string :price
      t.string :image_url
      t.text :description
      t.string :shoe_url

      t.timestamps
    end
  end
end
