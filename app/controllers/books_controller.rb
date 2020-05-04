class BooksController < ApplicationController
    
    def index
        @books = all_books

        flash.now[:notice] = "We have exactly #{@books.size} books available."

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
        @book = Book.new(post_params(:name, :genre, :pages, :year, :language, :copies))        
        @book.publisher = Publisher.find(post_params(:publisher)[:publisher])
        @book.author = Author.find(post_params(:author)[:author])
        @book.bookshelf = Bookshelf.find(post_params(:bookshelf)[:bookshelf])
        @book.available = params[:copies]
        @book.code = @book.name[0].upcase + @book.author.name[0].upcase + @book.author.last_name[0].upcase + @book.publisher.name[0].upcase + @book.publisher.city[0].upcase + generate_random_string()
        if @book.save
        redirect_to book_path(@book)
        else
            flash[:alert] = "Something gone wrong!"
            redirect_to new_book_path
        end
    end
    def edit
        @book = find_book_id
        @authors = Author.all
        @publishers = Publisher.all
        @bookshelves = Bookshelf.all 
    end    
    def update
        @book = find_book_id
        @book.update(post_params(:name, :genre, :pages, :year, :language, :copies))
        @book.publisher = Publisher.find(post_params(:publisher)[:publisher])
        @book.author = Author.find(post_params(:author)[:author])
        @book.bookshelf = Bookshelf.find(post_params(:bookshelf)[:bookshelf])
        @book.code = @book.name[0].upcase + @book.author.name[0].upcase + @book.author.last_name[0].upcase + @book.publisher.name[0].upcase + @book.publisher.city[0].upcase + generate_random_string()
        @book.save
        redirect_to book_path(@book)
    end
    def destroy
        @book = find_book_id
        @book.destroy
        redirect_to books_path
    end

    private  
    def generate_random_string(length=3)
        string = ""
        chars = ("A".."Z").to_a
        numbers = ("0".."9").to_a
        length.times do
          string << chars[rand(chars.length-1)]
          string << numbers[rand(numbers.length-1)]
        end
        string
      end  
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
