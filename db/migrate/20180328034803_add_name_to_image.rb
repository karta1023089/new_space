class AddNameToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :name, :string
    add_column :images, :url, :string
    add_column :images, :image_alt, :string
  end
end
