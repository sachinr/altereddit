class Article
  attr_accessor :title, :text, :author

  TITLE_ONLY_URLS = ['youtube.com', 'vimeo.com']

  def initialize(url)
    @url = url[-1, 1] == '/' ? url[0..-2] : url
    if TITLE_ONLY_URLS.detect { |str| @url.match(str) }
      fetch_title_from_diffbot
    else
      fetch_all_from_diffbot
    end
  end

  def fetch_all_from_diffbot
    response = diffbot_response
    @title = response["title"]
    @text = response["html"]
    @author = response["author"]
  end

  def fetch_title_from_diffbot
    response = diffbot_response(false)
    @title = response["title"]
    @text = ''
    @author = ''
  end

  def sanitized_text
    Sanitize.clean(text || '', Sanitize::Config::RELAXED).strip
  end

  private
  def diffbot_response(with_html = true)
    query = "token=#{ENV['DIFFBOT_TOKEN']}&url=#{@url}"
    query = "#{query}&html" if with_html

    HTTParty.get("http://www.diffbot.com/api/article?#{query}")
  end
end
