class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.datetime :deleted_at

      t.timestamps
    end
  end
end
