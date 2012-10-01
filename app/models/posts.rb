class Posts

  attr_accessor :reddit

  def initialize(reddit)
    @reddit = reddit
  end

  def top
    listing = reddit.get_listing(subreddit: 'programming', limit: 5)
    posts = []
    listing.parsed_response["data"]["children"].each do |post_json|
      posts << Post.new(post_json)
    end

    posts
  end
end
