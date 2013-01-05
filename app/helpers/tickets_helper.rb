module TicketsHelper

	def navbar_link name, path, icon
		render partial: 'navbar_link', locals: {
			path: path,
			name: name,
			icon: icon
		}
	end

end
