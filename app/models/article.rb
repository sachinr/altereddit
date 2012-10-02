class Article
  attr_accessor :title, :text, :author

  def initialize(url)
    query = "token=#{ENV['DIFFBOT_TOKEN']}&url=#{url}"
    response = HTTParty.get("http://www.diffbot.com/api/article?#{query}")

    @title = response["title"]
    @text = response["text"]
    @author = response["author"]
  end
end
