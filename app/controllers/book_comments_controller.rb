class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_back(fallback_location: book_path(book))
	end
	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.find_by(book_id: book.id)
		comment.destroy
		redirect_back(fallback_location: book_path(book))
	end
	private
	def book_comment_params
		params.require(:book_comment).permit(:user_id, :book_id, :comment)
	end
end
