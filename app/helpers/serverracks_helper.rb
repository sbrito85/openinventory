module ServerracksHelper
	def get_serverroom(room)
		if room == nil
			@serverrack.serverroom_id
		else
			room
		end
	end
end
