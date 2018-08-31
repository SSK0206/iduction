class StaticPagesController < ApplicationController


  def home
  	@user = current_user if user_signed_in?
  	@posts = Post.all
  	@rank = Post.order('likes_count Desc').limit(5)
  end

  def help
  end

end
