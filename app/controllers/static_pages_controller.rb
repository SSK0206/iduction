class StaticPagesController < ApplicationController


  def home
  	@user = current_user if user_signed_in?
  	@posts = Post.all
  end

  def help
  end

end
