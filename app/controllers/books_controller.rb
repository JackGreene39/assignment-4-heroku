class BooksController < ApplicationController
    def index
        @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
    end

    def edit   
        @book = Book.find(params[:id])
    end

    def create
        @book = Book.new(book_params)

        @book.save
        flash[:notice] = "Book created successfully."
        redirect_to @book
    end

    def update
        @book = Book.find(params[:id])
 
        @book.update(book_params)
        flash[:notice] = "Book updated successfully."
        redirect_to @book
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "Book '#{@book.title}' destroyed successfully."
        redirect_to books_path
    end

    private
        def book_params
            params.require(:book).permit(:title, :author, :genre, :price, :published_date)
        end
end
