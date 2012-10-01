class Post
  attr_accessor :title, :id

  def initialize(json_data)
    @title = json_data["data"]["title"]
    @id = json_data["data"]["id"]
  end

  def comments
    Comments.new(id).all
  end
end
