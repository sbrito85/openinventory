class AddSitecodeToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :sitecode, :string
  end
end
