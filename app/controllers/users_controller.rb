class UsersController < ApplicationController
  
  def new
  @user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to the Sample App!"
  	  redirect_to @user
    else render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user_messages_collection= Array.new
    @user.items.each do |item|
      item.messages.each do |msg|
        @user_messages_collection<<msg
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Details edited"
      redirect_to @user
    else render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
  end

end
