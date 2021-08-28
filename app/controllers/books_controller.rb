class BooksController < ApplicationController

  def index
    @user = current_user
    @new = Book.new
    @books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    #paramsとは送られてきたデータを受け取るメソッド
    @new = Book.new
    @user = @book.user
    #@bookのユーザーの***********。
  end

  def create

    @new = Book.new(book_params)
    @new.user_id = current_user.id
    if @new.save
      flash[:create] = 'You have created book successfully.'
      redirect_to book_path(@new.id)
    else
      @user = current_user
      @books = Book.all
      render :index
    end
  end

  def edit
     @book = Book.find(params[:id])
       if @book.user != current_user
          redirect_to books_path
       end
  end

  def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
        flash[:update] = 'You have updated book successfully.'
        redirect_to book_path
     else
       render :edit
     end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
