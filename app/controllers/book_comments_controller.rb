class BookCommentsController < ApplicationController

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

end
