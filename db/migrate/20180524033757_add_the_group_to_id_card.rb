class AddTheGroupToIdCard < ActiveRecord::Migration[5.1]
  def change
    add_column :id_cards, :the_group, :string
    add_column :combine_projects, :price, :string
    add_column :combine_projects, :en_name, :string
  end
end
