class AddUseWayToImage < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :use_way, :integer, :default => 0
  end
end
