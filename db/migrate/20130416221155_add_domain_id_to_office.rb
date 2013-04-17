class AddDomainIdToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :domain_id, :integer
    add_index :offices, :domain_id
  end
end
