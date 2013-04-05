class CreateLdapsyncs < ActiveRecord::Migration
  def change
    create_table :ldapsyncs do |t|

      t.timestamps
    end
  end
end
