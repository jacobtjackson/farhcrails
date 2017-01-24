class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "The category was created successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was an issue creating the category. Please try again."
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]

    if @category.update_attributes(category_params)
      flash[:notice] = "The category was saved successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was a problem saving the category. Please try again."
      redirect_to categories_path
    end
  end

  def destroy
    @category = Category.find params[:id]

    if @category.destroy
      flash[:notice] = "The category was deleted successfully."
      redirect_to categories_path
    else
      flash[:notice] = "There was a problem deleting the category. Please try again."
      redirect_to categories_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
