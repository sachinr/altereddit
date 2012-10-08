class Comments
  def self.fetch(post)
    comments_json = REDDIT.get_comments(post, depth: 2, limit: 5).parsed_response.last
    comments = []
    comments_json["data"]["children"].each do |comment_json|
      comments << Comment.new(comment_json)
    end

    comments
  end
end

