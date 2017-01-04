class NewsfeedsController < ApplicationController
  load_and_authorize_resource
  def index
    @newsfeeds = Newsfeed.all
  end

  def show
    @newsfeed = Newsfeed.find(params[:id])
  end

  def new
    @newsfeed = Newsfeed.new
  end

  def create
    @newsfeed = Newsfeed.new(newsfeed_params)
    @new_newsfeed = Newsfeed.new

    if @newsfeed.save
      flash[:notice] = "Message saved successfully."
    else
      flash[:alert] = "There was an error saving your message."
    end

    respond_to do |format|
      format.html { redirect_to admin_index_path }
      format.js
    end
  end

  def destroy
    @newsfeed = Newsfeed.find(params[:id])

    if @newsfeed.destroy
      flash[:notice] = "Message deleted successfully."
    else
      flash[:alert] = "There was an error deleting your message."
    end

    respond_to do |format|
      format.html { redirect_to admin_index_path }
      format.js
    end
  end

  private

  def newsfeed_params
    params.require(:newsfeed).permit(:message)
  end
end
