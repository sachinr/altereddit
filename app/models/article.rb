class Article
  attr_accessor :title, :text, :author

  def initialize(url)
    url = url[-1, 1] == '/' ? url[0..-2] : url
    query = "token=#{ENV['DIFFBOT_TOKEN']}&url=#{url}&html"
    response = HTTParty.get("http://www.diffbot.com/api/article?#{query}")
    @title = response["title"]
    @text = response["html"]
    @author = response["author"]
  end
end
