class UsersController < ApplicationController

	before_action :authenticate_user!, only:[:index, :show, :edit, :update]

	def index
		@user = current_user
		@users = User.all
		@post = Book.new
	end

	def show
		@post = Book.new
		@user = User.find(params[:id])
		@books = @user.books.all
	end

	def edit
		@user = User.find(params[:id])
		if @user.id != current_user.id
			redirect_to user_path(current_user.id)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id), notice: 'User was successfully updated'
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end

end
