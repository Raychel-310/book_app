class FavoritesController < ApplicationController

  def create
    #if !Favorite.exists?(book_id: params[:book_id], user_id: current_user.id)
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.new(book_id: @book.id)
      @favorite.save
      #redirect_to 'favorites/create'
    #end
  end

  def destroy
    #if Favorite.exists?(book_id: params[:book_id], user_id: current_user.id)
      @book = Book.find(params[:book_id])
      @favorite = current_user.favorites.find_by(book_id: @book.id)
      @favorite.destroy
    #end
  end
end
