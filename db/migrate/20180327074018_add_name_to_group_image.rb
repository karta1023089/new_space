class AddNameToGroupImage < ActiveRecord::Migration[5.1]
  def change
    add_column :group_images, :name, :string
  end
end
