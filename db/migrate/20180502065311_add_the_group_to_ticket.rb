class AddTheGroupToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :the_group, :string
  end
end
