class BooksController < ApplicationController
    def index
        @books = all_books
    end
    def show
        @book = find_book_id
    end
    def new
        @book = Book.new
        @authors = Author.all
        @publishers = Publisher.all
        @bookshelves = Bookshelf.all 
    end
    def create
        
        @book = Book.new(post_params(:code, :name, :genre, :pages, :year, :language))
        @book.publisher = Publisher.find(post_params(:publisher)[:publisher])
        @book.author = Author.find(post_params(:author)[:author])
        @book.bookshelf = Bookshelf.find(post_params(:bookshelf)[:bookshelf])
        

        @book.save
        redirect_to book_path(@book)
    end
    def edit
        @book = find_book_id
        @authors = Author.all
        @publishers = Publisher.all
        @bookshelves = Bookshelf.all 
    end    
    def update
        @book = find_book_id
        @book.update(post_params(:name, :city))
        redirect_to book_path(@book)
    end
    def destroy
        @book = find_book_id
        @book.destroy
        redirect_to books_path
    end

    private    
    def all_books
        Book.all
    end
    def find_book_id
        Book.find(params[:id])
    end
    def post_params(*args)
        params.require(:book).permit(*args)
    end
end
