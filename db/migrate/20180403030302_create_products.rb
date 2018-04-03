class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :cover
      t.string :image1
      t.string :image2
      t.string :image4
      t.string :name
      t.integer :price
      t.text :intro
      t.text :content
      t.datetime :deleted_at
      t.integer :category_id
      t.string :the_group

      t.timestamps
    end
  end
end
