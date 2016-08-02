class UsersController < ApplicationController
  before_action :authorize_user, except: [:new, :create]
  def index
    @user = User.find_by(params[:id])
  end

  def show
    @user = User.find_by(params[:id])
  end

  def new
     @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save
      flash[:notice] = "Thank you for registering. You will be notified when your access is approved."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.approved = params[:user][:approved]

    if @user.save
      flash[:notice] = "User was updated."
      redirect_to admin_index_path
    else
      flash.now[:alert] = "There was a problem updating the user. Please try again."
      render :edit
    end
  end

  private

  def authorize_user
    unless current_user.approved?
      flash[:alert] = "You must be approved to do that."
      redirect_to home_index_path
    end
  end
end
