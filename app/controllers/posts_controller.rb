class PostsController < ApplicationController
  def index
    @posts = Posts.new(reddit).top
  end
end
