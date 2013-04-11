class AddNewfieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :telephone, :string
    add_column :people, :accountname, :string
  end
end
