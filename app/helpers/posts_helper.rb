module PostsHelper
  include ActionView::Helpers::UrlHelper

  def article_summary(post)
    link = link_to("<br/></br>(continue)".html_safe, post.link, class: 'continue-link')
    truncate_html(post.article.sanitized_text, length: 1000, omission: link)
  end
end
