class CreateCombineProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :combine_projects do |t|
      t.text :tour
      t.text :traffic
      t.text :hotel
      t.integer :category_id
      t.boolean :price1_mark, :default => false
      t.integer :price1
      t.boolean :price2_mark, :default => false
      t.integer :price2
      t.boolean :price3_mark, :default => false
      t.integer :price3
      t.boolean :price4_mark, :default => false
      t.integer :price4
      t.string :cover
      t.string :image1
      t.string :image2
      t.string :image3
      t.integer :day
      t.string :name
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
