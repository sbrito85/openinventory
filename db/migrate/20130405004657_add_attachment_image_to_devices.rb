class AddAttachmentImageToDevices < ActiveRecord::Migration
  def self.up
    change_table :devices do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :devices, :image
  end
end
