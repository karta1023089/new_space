class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :name
      t.text :content
      t.datetime :deleted_at
      t.integer :status
      t.boolean :reply_mark
      t.text :reply

      t.timestamps
    end
  end
end
