class UsersController < ApplicationController
	before_action :authenticate_user!, :only => [:show, :edit, :update]

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		if @user.id == current_user.id
		else
			redirect_to "/"
			flash[:alert] = "無効なユーザー"
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.id == current_user.id
			@user.update(params.require(:user).permit(:name, :self_introduction))
			redirect_to :action => "edit", :id => @user.id
			flash[:notice] = "編集が完了しました"
    	else
      		redirect_to "/"
      		flash[:alert] = "無効なユーザー"
		end
	end
end
