module UsersHelper
  def no_user_posts
    @user.posts.count == 0
  end

  def no_user_comments
    @user.comments.count == 0
  end
end
