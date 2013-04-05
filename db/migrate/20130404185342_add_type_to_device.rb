class AddTypeToDevice < ActiveRecord::Migration
  def change
    add_column :devices, :assettype, :string
  end
end
