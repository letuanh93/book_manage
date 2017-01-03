class CategoriesController < ApplicationController
  before_action :user_signed_in?	
  before_action :load_book, except: [:index]	

 def index
    @categories = Category.order(created_at: :DESC).paginate page: params[:page]
    # @books = Book.by_category(params[:category_id].order(Title: :DESC)
 end

 def show
 	
 end

   private
  def load_book
    @book = Book.find_by id: params[:id]
  end

  def load_category
    @category = Category.find_by id: params[:id]
  end

end