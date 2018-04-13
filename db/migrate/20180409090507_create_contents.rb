class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :cover
      t.string :name
      t.date :show_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
