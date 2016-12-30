class Admin::CategoriesController < ApplicationController
  before_action :load_category, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @categories = Category.search(params[:search])
        .paginate page: params[:page], per_page: 2
    else
      @categories = Category.order(created_at: :DESC)
        .paginate page: params[:page], per_page: 2
    end
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category has been added"
      redirect_to admin_categories_url
    else
      render :new
      flash[:danger] = "Add category failed"
    end
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = "Category update success"
      redirect_to admin_categories_url
    else
      flash[:success] = "Cannot update category"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      if @category.books.any?
        flash[:danger] = "Category has any books, cannot delete it"
      else
        flash[:success] = "Category has been deleted"
      end
      redirect_to admin_categories_url
    end
  end

  private

    def category_params
      params.require(:category).permit :Name, :Description
    end

    def load_category
      @category = Category.find_by id: params[:id]
      if @category.nil?
        flash[:danger] = "Category not found"
        redirect_to admin_categories_url
      end
    end
end
