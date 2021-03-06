class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order('rating DESC').all

    filter_params.each do |key, value|
      @books = @books.public_send(key, value) if value.present?
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :rating, :price, :genre, :author)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def filter_params
    params.slice(:book_title, :book_author, :book_genre, :pricefrom, :priceto)
  end

end
