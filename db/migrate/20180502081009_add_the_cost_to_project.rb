class AddTheCostToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :cost, :integer
    add_column :combine_projects, :cost, :integer
  end
end
