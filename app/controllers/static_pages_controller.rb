class StaticPagesController < ApplicationController

  def home
  	@user = current_user
  	@posts = Post.all
  end

  def help
  end

end
