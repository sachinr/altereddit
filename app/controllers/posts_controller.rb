class PostsController < ApplicationController
  def index
    @posts = YAML::load($redis.get(:posts))
  end

  def refresh
    posts = Posts.latest('programming', 2)
    $redis.set(:posts, posts.to_yaml)

    redirect_to :root
  end
end
