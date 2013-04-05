class AddUsersToLdapsyncs < ActiveRecord::Migration
  def change
    add_column :ldapsyncs, :username, :string
  end
end
