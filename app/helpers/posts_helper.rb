module PostsHelper
  include ActionView::Helpers::UrlHelper

  def article_summary(post)
    link = link_to("<br/></br>(continue)".html_safe, post.link)
    truncate_html(post.article.text, length: 1000, omission: link)
  end
end
