class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
		@book_comment = BookComment.new (book_comment_params)
		@book_comment.book_id = @book.id
		@book_comment.user_id = current_user.id
		unless @book_comment.save
      render 'error' 
    end
    # app/views/book_comments/create.js.erbを参照する
		
		# if @book_comment.save
  		# redirect_to book_path(@book.id)
		# else
		  # render 'books/show'
		# end
  end
  
  # show/create計2回でnewを置き、
  # createではストパラ経由で1:Nの関係を明記してから、保存

  def destroy
  	@book = Book.find(params[:book_id])
  	book_comment = @book.book_comments.find(params[:id])
		book_comment.destroy
		# redirect_to book_path(@book.id)
		# =redirect_to request.referer(遷移元のURLにリダイレクト)
  end

  private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end
