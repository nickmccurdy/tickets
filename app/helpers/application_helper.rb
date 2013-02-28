# Provides helper methods for the application's models, views, and controllers.
module ApplicationHelper

  # Renders a nice display of an attribute with a given name and value.
  #
  # @param [String] name the name of the attribute
  # @param [String] value the value of the attribute
  #
  # @return [String] the generated HTML display of the attribute
  def show_attribute name, value
    render 'tickets/show_attribute', name: name, value: value
  end

end
