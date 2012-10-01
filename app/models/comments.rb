class Comments
  attr_accessor :reddit, :post

  def initialize(post)
    @reddit = Snoo::Client.new
    @post = post
  end

  def all
    comments_json = reddit.get_comments(post, depth: 2, limit: 5).parsed_response.last
    comments = []
    comments_json["data"]["children"].each do |comment_json|
      comments << Comment.new(comment_json)
    end

    comments
  end
end

