class RemoveColumnFromPeople < ActiveRecord::Migration
  def up
    remove_column :people, :office
  end

  def down
    add_column :people, :office, :string
  end
end
