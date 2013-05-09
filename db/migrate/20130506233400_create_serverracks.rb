class CreateServerracks < ActiveRecord::Migration
  def change
    create_table :serverracks do |t|
      t.string :name
      t.integer :totalunits
      t.integer :serverroom_id

      t.timestamps
    end
    add_index :serverracks, :name
    add_index :serverracks, :serverroom_id
  end
end
