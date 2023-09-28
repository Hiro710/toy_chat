module ApplicationHelper
  # ページごとの完全なタイトルを返す
  # メソッド定義とオプション引数
  def full_title(page_title = '')
    base_title = "Welcome to TOYBOX!"
    if page_title.empty?    # empty?メソッドを使ってpage_title変数内の文字列が空の時にtrue
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
