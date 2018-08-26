class UsersController < ApplicationController
	before_action :authenticate_user!, :only => [:edit, :update]

	def show
		@user = User.find(params[:id])
    	@posts = @user.posts.all
	end

	def edit
		@user = User.find(params[:id])
		@user.avatar.cache! unless @user.avatar.blank? #avatarが空だったら何もしない
		if @user.id == current_user.id
		else
			redirect_to "/"
			flash[:alert] = "無効なユーザー"
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.id == current_user.id
			@user.update(user_params)
			redirect_to :action => "edit", :id => @user.id
			flash[:notice] = "編集が完了しました"
    	else
      		redirect_to "/"
      		flash[:alert] = "無効なユーザー"
		end
	end


	private

		def user_params
			params.require(:user).permit(:name, :self_introduction, :avatar, :avatar_cache)
		end
end
