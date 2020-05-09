class TagsController < ApplicationController
    def create
        @tag = Tag.new(post_params(:name))
        @book = Book.find(params[:book])
        @tag.book << @book
        @tag.save
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
