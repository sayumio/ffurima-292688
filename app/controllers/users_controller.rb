class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  # def show
  #   @user = User.find(params[:id])
  # end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :encrypted_password, :family_name, :first_name, :kana_family_name, :kana_first_name, :birth_date)
  end

end
