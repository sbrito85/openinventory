class AddOrderNumToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :order_num, :string
  end
end
