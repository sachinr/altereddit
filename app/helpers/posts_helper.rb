module PostsHelper
  def article_summary(post)
    truncate(post.article.text, length: 1000, seperator: ' ', omission: '...')
  end
end
