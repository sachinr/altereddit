class Post
  attr_accessor :id, :title, :link, :comments, :article

  def initialize(json_data)
    @title = json_data["data"]["title"]
    @link = json_data["data"]["url"]
    @id = json_data["data"]["id"]

    fetch_comments
    fetch_article
  end

  private
  def fetch_comments
    @comments = Comments.fetch(id)
  end

  def fetch_article
    @article = Article.new(link)
  end
end
