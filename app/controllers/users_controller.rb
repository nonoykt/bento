class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      logger.debug "user: #{@user.attributes.inspect}"
      redirect_to users_url(@user), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def update
    if @user.update
      redirect_to users_url(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url, notice: "ユーザー「#{@user.name}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find_by(params[:id])
  end

end
