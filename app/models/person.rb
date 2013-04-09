class Person < ActiveRecord::Base
   attr_accessible :username, :department, :title, :office

   has_many :asset

   def self.import(file)
   		CSV.foreach(file.path,headers:true) do |row|
   			person = find_by_id(row["id"]) || new
   			person.attributes = row.to_hash.slice(*accessible_attributes)
   			Person.create! row.to_hash
   		end
   end
end
