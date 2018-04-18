class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.datetime :deleted_at
      t.text :intro

      t.timestamps
    end
  end
end
