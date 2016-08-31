class AdminController < ApplicationController
  before_action :authorize_user
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
    @unapproved_users = User.unapproved
    @approved_users = User.approved
    @newsletters = Newsletter.all
    @message = Message.new
    @trainings = TMaterial.all
    @newsfeeds = Newsfeed.all
    @newsfeed = Newsfeed.new
  end

  def show
    @user = User.find_by(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def approve
    User.where(id: params[:user_id]).update_all(approved: true)

    redirect_to admin_index_path
  end

  def unapprove
    User.where(id: params[:user_id]).update_all(approved: false)

    redirect_to admin_index_path
  end

  private

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to home_index_path
    end
  end
end
