class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
  end

  def show
    @newsletter = Newsletter.find(params[:id])
  end

  def new
    @newsletter = Newsletter.new
  end

  def create
    @newsletter = Newsletter.new
    @newsletter.name = params[:newsletter][:name]
    @newsletter.file = params[:newsletter][:file]

    if @newsletter.save
      flash[:notice] = "The newsletter was uploaded successfully."
      redirect_to admin_index_path
    else
      flash[:alert] = "The upload failed, please try again."
      redirect_to new_newsletter_path
    end
  end
end
