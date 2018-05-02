class AddMakeDayToIdCard < ActiveRecord::Migration[5.1]
  def change
    add_column :id_cards, :make_day, :integer
  end
end
