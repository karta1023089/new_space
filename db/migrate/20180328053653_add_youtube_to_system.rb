class AddYoutubeToSystem < ActiveRecord::Migration[5.1]
  def change
    add_column :systems, :youtube, :text
  end
end
