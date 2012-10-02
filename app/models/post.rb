class Post
  attr_accessor :title, :id, :link

  def initialize(json_data)
    @title = json_data["data"]["title"]
    @link = json_data["data"]["url"]
    @id = json_data["data"]["id"]
  end

  def comments
    @comments ||= Comments.new(id).all
  end

  def article
    @article ||= Article.new(link)
  end
end
