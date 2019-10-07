module ApplicationHelper
  # フラッシュメッセージのCSSクラスを指定するヘルパー
  def flash_class(level)
    case level
    when 'notice' then 'alert-info'
    when 'alert'  then 'alert-warning'
    else "alert-#{level}"
    end
  end
end
