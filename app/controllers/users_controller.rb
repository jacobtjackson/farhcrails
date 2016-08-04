class UsersController < ApplicationController

  before_action :authorize_user

  def index
    @user = User.find_by(params[:id])
  end

  def show
    @user = User.find_by(params[:id])
  end

  private

  def authorize_user
    unless current_user.approved?
      flash[:alert] = "You must be approved to do that."
      redirect_to home_index_path
    end
  end
end
