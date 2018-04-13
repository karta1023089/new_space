class AddUseTypeToMyAd < ActiveRecord::Migration[5.1]
  def change
    add_column :my_ads, :use_type, :integer, :default => 0
  end
end
