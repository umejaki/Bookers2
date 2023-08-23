class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to books_path
  else
    @books = Book.all
    render :index
  end
  end
   
  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end
  
  def show
    @books = @user.books
    @book = Book.find(params[:id])
    
  end
  
  def edit
    @book = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path
  end
  
   def destroy
    post_image = Book.find(params[:id])
    post_image.destroy
    redirect_to books_path
   end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
  
end