class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def full_name
    case I18n.locale
    when :ja then "#{object.last_name} #{object.first_name}" 
    else "#{object.first_name} #{object.last_name}" 
    end
    
  end
end
