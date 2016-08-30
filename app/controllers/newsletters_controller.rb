class NewslettersController < ApplicationController
  def index
    @newsletters = Newsletter.all
    @message = Message.new
  end

  def show
    @newsletter = Newsletter.find(params[:id])
    @message = Message.new
  end

  def new
    @newsletter = Newsletter.new
    @message = Message.new
  end

  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      flash[:notice] = "The newsletter was uploaded successfully."
      redirect_to admin_index_path
    else
      flash[:alert] = "The upload failed, please try again."
      redirect_to new_newsletter_path
    end
  end

  def edit
    @newsletter = Newsletter.find(params[:id])
  end

  def update
    @newsletter = Newsletter.find(params[:id])
    @newsletter.assign_attributes(newsletter_params)

    if @newsletter.save
      flash[:notice] = "The newsletter was updated successfully."
      redirect_to @newsletter
    else
      flash[:alert] = "The newsletter failed to update, please try again."
      render :edit
    end
  end

  def destroy
    @newsletter = Newsletter.find(params[:id])

    if @newsletter.destroy
      flash[:notice] = "The newsletter was deleted successfully."
      redirect_to admin_index_path
    else
      flash[:alert] = "There was an issue deleting the newsletter."
      render :show
    end
  end

  private

  def newsletter_params
    params.require(:newsletter).permit(:name, :newsletter)
  end
end
