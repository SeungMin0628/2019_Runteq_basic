module AdminHelper
  def active_if(*current_controllers)
    'active' if active_menu?(*current_controllers)
  end

  def active_menu?(*current_controllers)
    current_controllers.any? { |c| c == controller_path }
  end
end
