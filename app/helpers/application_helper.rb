module ApplicationHelper

	def path_is? str
		request.path == str
	end

	def navbar_link name, path, icon=nil
		render partial: 'navbar_link', locals: {
			path: path,
			name: name,
			icon: icon
		}
	end

	def show_attribute name, value
		render partial: 'show_attribute', locals: {
			name: name,
			value: value
		}
	end

end
