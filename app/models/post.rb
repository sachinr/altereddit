class Post
  attr_accessor :id, :title, :link, :comments, :article,
                :author, :author_link, :permalink

  def initialize(json_data)
    @title = json_data["data"]["title"]
    @link = json_data["data"]["url"]
    @id = json_data["data"]["id"]
    @author = json_data["data"]["author"]
    @author_link = "http://www.reddit.com/u/#{author}"
    @permalink = "http://www.reddit.com#{json_data["data"]["permalink"]}"

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
