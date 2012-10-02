class PostsController < ApplicationController
  def index
    @posts = Posts.latest('programming', 2)
  end
end
