class AddArticle1ToTicket < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :article1, :text
    add_column :tickets, :article2, :text
    add_column :tickets, :article3, :text
    add_column :tickets, :article4, :text
    add_column :tickets, :article5, :text
    add_column :tickets, :article6, :text
  end
end
