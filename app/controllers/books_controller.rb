class BooksController < ApplicationController
  # アクションのフィルターをかける
  # before_action :authorize
  before_action :authenticate_user!

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      @books = Book.all.order(id: "DESC")
      render action: :new
    end
  end

  def index
    @book = Book.new
    @books = Book.all.order(id: "DESC")
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @books = Book.all.order(id: "DESC")
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to action: :new
  end


  # ユーザーがログインしていなければTOPにリダイレクト
  # private def authorize
  #   unless user_signed_in?
  #     redirect_to controller: :top, action: :index
  #   end
  # end

  private def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
