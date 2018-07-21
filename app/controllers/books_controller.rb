class BooksController < ApplicationController
	before_action :authenticate_user!, only:[:create, :index, :show, :edit, :update, :destroy]

	def create
		@post = Book.new(book_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to book_path(id: @post.id), notice: 'Book was successfully created'
		else
			@user =  current_user
			@books = Book.all
			render :index
		end
	end

	def index
		@books = Book.all
		@user =  current_user
		@post = Book.new
		@post.user_id = current_user.id
	end

	def show
		@post = Book.new
		@book = Book.find(params[:id])
		@user = User.find(@book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end

	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: 'Book was successfully updated'
		else
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path, notice: 'Book was successfully destroyed'
	end


	private

	def book_params
		params.require(:book).permit(:title, :opinion, :user_id)
	end

end
