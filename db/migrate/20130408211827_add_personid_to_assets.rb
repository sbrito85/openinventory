class AddPersonidToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :person_id, :integer
    add_index :assets, :person_id
  end
end
