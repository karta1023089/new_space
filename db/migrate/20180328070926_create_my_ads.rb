class CreateMyAds < ActiveRecord::Migration[5.1]
  def change
    create_table :my_ads do |t|
      t.string :file
      t.integer :priority
      t.datetime :deleted_at
      t.string :name
      t.string :url
      t.string :image_alt

      t.timestamps
    end
  end
end
