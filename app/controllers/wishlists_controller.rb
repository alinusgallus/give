class WishlistsController < ApplicationController

  def create
    @wishlist=current_user.wishlists.build(whishlist_params)
    @item =Item.find_by(id: @wishlist.item_id)
    respond_to do |format|
    if @wishlist.save
      format.html {redirect_to user_wishlists_path(current_user.id)} 
      format.js
    else  
      format.html
      format.js
    end
    end
  end
    
  def destroy
    @item =Item.find_by params[:id]
    respond_to do |format|
      format.js
    end
    
  end

  private

  def whishlist_params
  	params.require(:wishlist).permit(:user_id,:item_id)
  end
  
end
