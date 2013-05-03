class AddImageRemoteUrlToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :image_remote_url, :string
  end
end
