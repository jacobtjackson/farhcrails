class RefvideosController < ApplicationController
  load_and_authorize_resource

  def index
    @refvideos = Refvideo.all
  end

  def show
    @refvideo = Refvideo.find params[:id]
  end

  def new
    @refvideo = Refvideo.new
  end

  def create
    @refvideo = Refvideo.new(resource_params)
    if @refvideo.save
      flash[:notice] = "The reference video was created successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an error creating the reference video. Please try again."
      redirect_to categories_path
    end
  end

  def edit
    @refvideo = Refvideo.find params[:id]
  end

  def update
    @refvideo = Refvideo.find params[:id]

    if @refvideo.update(resource_params)
      flash[:notice] = "The reference video was updated successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an issue updating the reference video. Please try again."
      redirect_to categories_path
    end
  end

  def destroy
    @refvideo = Refvideo.find params[:id]

    if @refvideo.destroy
      flash[:notice] = "The reference video was deleted successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an error deleting the reference video. Please try again."
      redirect_to categories_path
    end
  end

  private

  def resource_params
    params.require(:refvideo).permit(:name, :url, :body, :category_id)
  end
end
