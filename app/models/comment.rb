class Comment
  attr_accessor :body

  def initialize(comment_json)
    @body = comment_json["data"]["body"]
  end

end

