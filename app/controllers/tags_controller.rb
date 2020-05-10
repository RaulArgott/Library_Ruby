class TagsController < ApplicationController
    def create
        @book = Book.find(params[:book])
        if Tag.exists?(name: post_params(:name)[:name])
            @tag = Tag.find_by(name: post_params(:name)[:name])
        else 
            @tag = Tag.new(post_params(:name))
            @tag.save
        end            
        
        @book.tag << @tag
        @book.save
        redirect_to book_path(@book)
    end
    def index
        @tags = Tag.all
    end
    def show
        @tag = Tag.find(params[:id])
    end
    private
    def post_params(*args)
        params.require(:tag).permit(*args)
    end
end
