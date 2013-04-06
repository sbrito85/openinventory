module AssetsHelper
	def get_models
  Device.uniq.pluck(:id)    
end 
def get_people
  Person.uniq.pluck(:username)    
end
def get_clients
  Client.uniq.pluck(:client)    
end  
	def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
end
end
