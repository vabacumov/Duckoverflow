class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @questions = @user.questions
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      session[:user_id] = @user.id
      p session[:user_id]
      redirect_to @user
    else
      render 'new'
    end
  end

  def login

  end

  def login_user
    @user = User.find_by_username(params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      @error = false
      redirect_to @user
    else
      @error = true
      render 'login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :username)
    end
end

