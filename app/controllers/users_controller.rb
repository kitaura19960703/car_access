class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_path(@user)
    end
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end
  def show
    @user = User.find(params[:id])
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :age, :last_address, :email)
    # (user_params)とアクションの後ろにつけることでrequireのpermit(カラム)を変更したりできる
  end
end