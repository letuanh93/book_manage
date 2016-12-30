class Admin::BooksController < ApplicationController
  before_action :load_categories
  before_action :load_book, only: [:destroy, :edit, :update]

  def index
    # if params[:search]
    #   @books = Book.search(params[:search]).paginate page: params[:page], per_page: 2
    # else
    #   @books = Book.order(created_at: :DESC).in_category(params[:Category_id]).paginate page: params[:page], per_page: 2
    # end

    params[:search] ||= ""
    # params[:word_filter] ||= Settings.word_filter[:all]
    # @categories = Category.all
    @books = Book.order(created_at: :DESC).in_category(params[:Category_id])
      .send("filter", params[:search]).paginate page: params[:page], per_page: 2
  end

  def new
    @book = Book.new
  end

  def edit
    params[:Category_id] = @book.Category_id if @book
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = "Tao book thanh cong"
      redirect_to admin_books_url
    else
      flash[:danger] = "Failed"
      render :new
    end
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = "Update book success"
      redirect_to admin_books_url
    else
      flash[:danger] = "cannot update book"
    end
  end

  def destroy
    if @book.destroy
      flash[:success] = "Delete book success"
    else
      flash[:danger] = "Failed to delete book"
    end
    redirect_to admin_books_url
  end

  private

    def book_params
      params.require(:book)
        .permit :Title, :Description, :Page_number, :Author, :Publisher, :Category_id
    end

    def load_categories
      @categories = Category.all
    end

    def load_book
      @book = Book.find_by id: params[:id]
    end
end
