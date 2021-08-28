class UsersController < ApplicationController
  
  def index
    @user = current_user
    @new = Book.new
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @new = Book.new
    @books = @user.books
  end
  
  def edit
    @user = User.find(params[:id])
      if @user != current_user
         redirect_to user_path(current_user.id)
      end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:profile] = 'You have updated user successfully.'
       redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  
end  
  
private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

