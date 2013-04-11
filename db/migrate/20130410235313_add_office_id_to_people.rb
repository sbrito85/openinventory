class AddOfficeIdToPeople < ActiveRecord::Migration
  def change
    add_column :people, :office_id, :integer
    add_index :people, :office_id
  end
end
