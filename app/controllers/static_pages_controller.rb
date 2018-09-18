class StaticPagesController < ApplicationController


  def home
  	@user = current_user if user_signed_in?
  	@rank = Post.order('likes_count Desc').limit(5)

  	if params[:post] && params[:post][:title]
	    post_title = params[:post][:title]
	    @posts = Post.where(title: post_title)
  	else
    	@posts = Post.all
  	end
  	
  end

  def help
  end

end
