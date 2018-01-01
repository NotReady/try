module ApplicationHelper
  
  # ページタイトルを取得します
  def page_title
    title = "Morning Glory"
    title = @page_title + " - " + title if @page_title
    title
  end
  
  # メニューリンクを作成します
  def menu_link_to(text, path)
    link_to_unless_current(text, path) do
      content_tag(:span, text)
    end
  end
end
