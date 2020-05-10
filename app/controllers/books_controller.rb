class BooksController < ApplicationController
    
    def index
        @books = all_books
    end
    def show
        @book = find_book_id
        @tags = Tag.where(book: @book)
        @fav_exists = Favourite.where(book: @book, user: current_user) == [] ? false : true
    end
    def new
        @book = Book.new
        @authors = Author.all
        @publishers = Publisher.all
        @bookshelves = Bookshelf.all 
    end
    def create        
        @book = Book.new(post_params(:name, :genre, :pages, :edition, :language, :copies, :publisher_id, :author_id, :bookshelf_id))        
        if @book.save
            @book.available = @book.copies
            @book.code = @book.name[0].upcase + @book.author.name[0].upcase + @book.author.last_name[0].upcase + @book.publisher.name[0].upcase + @book.publisher.city[0].upcase + generate_random_string()+@book.edition.to_s
            @book.save
            flash[:alert] = "Book created!"
            redirect_to book_path(@book)
        else
            flash[:alert] = "Something gone wrong!"            
            @authors = Author.all
            @publishers = Publisher.all
            @bookshelves = Bookshelf.all 
            render :new
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
        if @book.update(post_params(:name, :genre, :pages, :edition, :language, :copies, :publisher_id, :author_id, :bookshelf_id))
            flash[:alert] = "Book edited!"  
            redirect_to book_path(@book)
        else 
            flash[:alert] = "Something gone wrong!"  
            @authors = Author.all
            @publishers = Publisher.all
            @bookshelves = Bookshelf.all 
            render :edit
        end
    end
    def destroy
        @book = find_book_id
        @book.destroy
        flash[:alert] = "Book deleted"  
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
