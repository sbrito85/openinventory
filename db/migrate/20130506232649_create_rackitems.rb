class CreateRackitems < ActiveRecord::Migration
  def change
    create_table :rackitems do |t|
      t.integer :asset_id
      t.integer :unitsize
      t.string :position
      t.string :ipaddress
      t.text :comments
      t.integer :serverrack_id

      t.timestamps
    end
    add_index :rackitems, :asset_id
    add_index :rackitems, :serverrack_id
  end
end
