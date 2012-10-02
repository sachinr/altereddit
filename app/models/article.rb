class Article

  def initialize(url)
    query = "token=#{ENV['DIFFBOT_TOKEN']}&url=#{url}"
    @response = HTTParty.get("http://www.diffbot.com/api/article?#{query}")
  end

  def title
    @response["title"]
  end

  def text
    @response["text"]
  end
end
