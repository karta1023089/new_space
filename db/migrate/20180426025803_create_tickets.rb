class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :name
      t.string :cover
      t.string :image1
      t.string :image2
      t.string :image3
      t.string :image4
      t.datetime :deleted_at
      t.text :intro
      t.text :content
      t.integer :price

      t.timestamps
    end
  end
end
