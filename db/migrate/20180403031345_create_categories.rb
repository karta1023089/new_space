class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :category_type
      t.integer :parent_id
      t.integer :priority
      t.datetime :deleted_at
      t.boolean :open_mark
      t.string :cover_image

      t.timestamps
    end
  end
end
