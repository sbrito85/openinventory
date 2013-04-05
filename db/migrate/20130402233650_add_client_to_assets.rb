class AddClientToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :client, :integer
  end
end
