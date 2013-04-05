class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :office

      t.timestamps
    end
  end
end
