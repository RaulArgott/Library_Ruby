class HomeController < ApplicationController
  def index
  	@books = Book.all.size
  	@users = User.all.size
  	@tag = Tag.all.size
  	@favourite = Favourite.all.size
  end
end
