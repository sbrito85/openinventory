class AddOuToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :ou, :string
  end
end
