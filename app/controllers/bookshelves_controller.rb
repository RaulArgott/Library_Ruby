class BookshelvesController < ApplicationController
    def index
        @bookshelves = all_bookshelves
    end
    def show
        @bookshelf = find_bookshelf_id
    end
    def new
        @bookshelf = Bookshelf.new
    end
    def create
        @bookshelf = Bookshelf.new(post_params(:number, :side))
        @bookshelf.save
        redirect_to bookshelf_path(@bookshelf)
    end
    def edit
        @bookshelf = find_bookshelf_id
    end    
    def update
        @bookshelf = find_bookshelf_id
        @bookshelf.update(post_params(:number, :side))
        redirect_to bookshelf_path(@bookshelf)
    end
    def destroy
        @bookshelf = find_bookshelf_id
        @bookshelf.destroy
        redirect_to bookshelves_path
    end

    private    
    def all_bookshelves
        Bookshelf.all
    end
    def find_bookshelf_id
        Bookshelf.find(params[:id])
    end
    def post_params(*args)
        params.require(:bookshelf).permit(*args)
    end
end
