class UsersController < ApplicationController
  # def show
  #   @user = User.find(params[:id])
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザーを登録しました'
      redirect_to tasks_path
    else
      flash.now[:danger] = 'ユーザー登録が失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
