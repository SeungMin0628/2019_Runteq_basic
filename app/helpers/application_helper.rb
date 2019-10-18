module ApplicationHelper
  # フラッシュメッセージのCSSクラスを指定するヘルパー
  def flash_class(level)
    case level
    when 'notice' then 'alert-info'
    when 'alert'  then 'alert-warning'
    else "alert-#{level}"
    end
  end

  # ウェブページのタイトルを出力する
  def page_title(title)
    if title.blank?
      'RUNTEQ NORMAL APP'
    else
      "#{title} | RUNTEQ NORMAL APP"
    end
  end
end
