class UsersController < ApplicationController
  def index
    @user = User.find_by(params[:id])
    @message = Message.new
    @newsletters = Newsletter.all
    @newsfeeds = Newsfeed.all
    @trainings = TMaterial.all
  end

  def show
    @user = User.find_by(params[:id])
  end
end
