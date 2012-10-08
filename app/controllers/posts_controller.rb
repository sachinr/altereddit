require_dependency 'post'
require_dependency 'comment'
require_dependency 'article'

class PostsController < ApplicationController
  def index
    @posts = YAML::load(REDIS.get(:posts))
  end

  def refresh
    posts = Posts.latest('programming', 2)
    REDIS.set(:posts, posts.to_yaml)

    redirect_to :root
  end
end
