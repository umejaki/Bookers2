class BooksController < ApplicationController
  
  def new
    @user = current_user
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
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
    @user = current_user
    @book = Book.new
    @booker = Book.find(params[:id])
    @books = Book.all
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  
    def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to  book_path
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