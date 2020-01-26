class BookCommentsController < ApplicationController

	  before_action :authenticate_user!
	  before_action :correct_user, only: [:edit, :update]

	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end

	def edit
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
	end

	def update
		@book_comment = BookComment.find(params[:id])
		@book = Book.find(params[:book_id])
		@book_comment.update(book_comment_params)
		redirect_to book_path(@book)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
		@book_comment.destroy
		redirect_to book_path(@book)
	end

	private
	def
		book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end

	def correct_user
		book_comment = BookComment.find(params[:id])
		if current_user.id != book_comment.user.id
			redirect_to books_path
		end
	end

end
