class AddPriceToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :go_date, :date
    add_column :tickets, :backe_date, :date
    add_column :tickets, :url, :string
  end
end
