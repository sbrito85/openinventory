module RackitemsHelper
	def get_assets
  	Asset.uniq.pluck(:asset)    
	end  
	def get_rack(serverrack)
		if serverrack == nil
			@serverrack.id
		else
			serverrack
		end
	end
end
