class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :name
      t.string :dc
      t.string :dn
      t.string :adminUser
      t.string :adminPass

      t.timestamps
    end
  end
end
