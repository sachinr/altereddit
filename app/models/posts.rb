class Posts
  def self.latest(subreddit, limit)
    listing = $reddit.get_listing(subreddit: subreddit, limit: limit)
    posts = []
    listing.parsed_response["data"]["children"].each do |post_json|
      posts << Post.new(post_json)
    end

    posts
  end
end
