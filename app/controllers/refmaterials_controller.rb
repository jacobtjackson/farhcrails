class RefmaterialsController < ApplicationController
  load_and_authorize_resource

  def index
    @refmaterials = Refmaterial.all
  end

  def new
    @refmaterial = Refmaterial.new
  end

  def create
    @refmaterial = Refmaterial.new(refmaterial_params)
    if @refmaterial.save
      flash[:notice] = "The reference material was created successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an issue creating the reference material. Please try again."
      redirect_to new_refmaterial_path
    end
  end

  def edit
    @refmaterial = Refmaterial.find params[:id]
  end

  def update
    @refmaterial = Refmaterial.find params[:id]
    if @refmaterial.save(refmaterial_params)
      flash[:notice] = "The reference material was updated successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an issue updating the reference material. Please try again."
      redirect_to categories_path
    end
  end

  def destroy
    @refmaterial = Refmaterial.find params[:id]
    if @refmaterial.destroy
      flash[:notice] =  "The reference material was deleted successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an issue deleting the reference material. Please try again."
      redirect_to categories_path
    end
  end

  private

  def refmaterial_params
    params.require(:refmaterial).permit(:name, :file, :category_id)
  end
end
