class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
