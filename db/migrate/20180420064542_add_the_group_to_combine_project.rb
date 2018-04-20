class AddTheGroupToCombineProject < ActiveRecord::Migration[5.1]
  def change
    add_column :combine_projects, :the_group, :string
  end
end
