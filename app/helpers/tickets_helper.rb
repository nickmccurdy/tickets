module TicketsHelper

	def path_contains? str
		request.path.include? str
	end

	def navbar_link name, path, icon=nil
		render partial: 'navbar_link', locals: {
			path: path,
			name: name,
			icon: icon
		}
	end

end
