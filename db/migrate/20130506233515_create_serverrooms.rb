class CreateServerrooms < ActiveRecord::Migration
  def change
    create_table :serverrooms do |t|
      t.string :name
      t.integer :office_id

      t.timestamps
    end
    add_index :serverrooms, :name
    add_index :serverrooms, :office_id
  end
end
