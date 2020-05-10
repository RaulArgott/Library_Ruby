class FavouritesController < ApplicationController
  def update
    book = Book.find(params[:book])
    favourite = Favourite.where(book: book, user: current_user)
    if favourite == []
        # Create fav
        Favourite.create(book: Book.find(params[:book]), user: current_user)
        @fav_exists = true
    else 
        favourite.destroy_all
        @fav_exists = false
    end
      redirect_to book_path(book)
  end
  def index
  
  end
end