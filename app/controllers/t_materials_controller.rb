class TMaterialsController < ApplicationController
  load_and_authorize_resource
  def index
    @trainings = TMaterial.all
    @message = Message.new
  end

  def show
    @training = TMaterial.find(params[:id])
    @message = Message.new
  end

  def new
    @training = TMaterial.new
    @message = Message.new
  end

  def create
    @training = TMaterial.new(training_params)

    if @training.save
      flash[:notice] = "The training video was saved successfully."
      redirect_to admin_index_path
    else
      flash[:alert] = "There was a problem saving the training video. Please try again."
      render :new
    end
  end

  def edit
    @training = TMaterial.find(params[:id])
    @message = Message.new
  end

  def update
    @training = TMaterial.find(params[:id])
    @training.update_attributes(training_params)

    if @training.save
      flash[:notice] = "The training video was saved successfully."
      redirect_to admin_index_path
    else
      flash[:alert] = "There was a problem saving the training video. Please try again."
      render :new
    end
  end

  def destroy
    @training = TMaterial.find(params[:id])

    if @training.destroy
      flash[:notice] = "The training video was deleted."
      redirect_to admin_index_path
    else
      flash[:alert] = "There was a problem deleting the training video. Please try again."
      render :show
    end
  end

  private

  def training_params
    params.require(:t_material).permit(:name, :url, :body)
  end
end
