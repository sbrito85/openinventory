class AddFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :username, :string
    add_column :people, :department, :string
    add_column :people, :title, :string
    add_column :people, :office, :string
  end
end
