class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :device_id
      t.string :serial
      t.string :asset
      t.integer :office_id
      t.string :assigned_to
      t.string :po_num
      t.text :comments
      t.date :acquired
      t.date :refresh
      t.string :machine_name
      t.boolean :disposed
      t.integer :user_id

      t.timestamps
    end
  end
end
