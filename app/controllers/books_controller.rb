class BooksController < ApplicationController
  # アクションのフィルターをかける
  before_action :authorize

  def create
    @book = Book.new(params.require(:book).permit(:title, :body))
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      @books = Book.all
      render 'index'
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end

  # ユーザーがログインしていなければTOPにリダイレクト
  private def authorize
    unless user_signed_in?
      redirect_to top      
    end
  end
end
