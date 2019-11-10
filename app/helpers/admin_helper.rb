module AdminHelper
  def nav_item_class(nav, active)
    return 'active' if nav == active
  end
end
