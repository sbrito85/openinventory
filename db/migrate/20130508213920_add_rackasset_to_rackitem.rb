class AddRackassetToRackitem < ActiveRecord::Migration
  def change
    add_column :rackitems, :rackasset, :string
  end
end
