class CreateGroupImages < ActiveRecord::Migration[5.1]
  def change
    create_table :group_images do |t|
      t.string :remark
      t.string :width
      t.string :height
      t.datetime :deleted_at
      t.integer :group_type

      t.timestamps
    end
  end
end
