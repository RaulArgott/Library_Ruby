class FavouritesController < ApplicationController
  def update
      favourite = Favourite.where(book: Book.find(params[:book]), user: current_user)
      if favourite == []
          # Create fav
          Favourite.create(book: Book.find(params[:book]), user: current_user)
          @fav_exists = true
      else 
          favourite.destroy_all
          @fav_exists = false
      end
      respond_to do |format|
          format.js {}
      end
  end
  def index
  
  end
end