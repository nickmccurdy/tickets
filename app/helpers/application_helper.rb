# Provides helper methods for the application's models, views, and controllers.
module ApplicationHelper

  # Renders a Bootstrap-ified navbar link with an optional icon.
  #
  # @param [String] name the name of the link, which is displayed to the user
  # @param [String] path the path that the link should bring the user to
  # @param [String] icon the name of the Bootstrap icon to display with the link
  # (excluding "icon-")
  #
  # @return [String] the generated HTML navbar link
  def navbar_link name, path, icon=nil
    render 'tickets/navbar_link', path: path, name: name, icon: icon
  end

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
