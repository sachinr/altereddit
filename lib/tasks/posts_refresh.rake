namespace :refresh do
  desc "Fetch the latest posts and comments from Reddit"
  task :all => :environment do
    puts "Fetching posts from Reddit"
    posts = Posts.latest('programming', 5)
    REDIS.set(:posts, posts.to_yaml)
  end
end
