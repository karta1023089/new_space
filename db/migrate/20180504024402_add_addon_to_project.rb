class AddAddonToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :addon, :string
    add_column :combine_projects, :addon, :string
  end
end
