class CreateIdCards < ActiveRecord::Migration[5.1]
  def change
    create_table :id_cards do |t|
      t.string :name
      t.string :cover
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
