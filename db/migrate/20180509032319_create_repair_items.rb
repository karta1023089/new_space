class CreateRepairItems < ActiveRecord::Migration[5.1]
  def change
    create_table :repair_items do |t|
      t.string :name
      t.text :content
      t.date :happen_date
      t.datetime :deleted_at
      t.integer :repair_id

      t.timestamps
    end
  end
end
