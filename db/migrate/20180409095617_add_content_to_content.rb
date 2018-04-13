class AddContentToContent < ActiveRecord::Migration[5.1]
  def change
    add_column :contents, :content, :text
  end
end
