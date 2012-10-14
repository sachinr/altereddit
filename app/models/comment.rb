class Comment
  attr_accessor :author, :body

  def initialize(comment_json)
    data = comment_json["data"]
    @body = data["body"]
    @author = data["author"]
    downs = data["downs"]
    ups = data["ups"]
    @score = ups.to_f - downs.to_f
  end

end

