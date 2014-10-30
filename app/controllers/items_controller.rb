class ItemsController < ApplicationController
before_filter :determine_scope
before_filter :signed_in_user, only: :new

def new
  @item = Item.new
end

def create
   @item = current_user.items.build(item_params)
   @item.save
   redirect_to @item
end

def show
  @item = Item.find(params[:id])
end

def edit
  @item = Item.find(params[:id])
end


def update
  @item= Item.find(params[:id])
  if @item.update(item_params)
      flash[:success] = "Item updated"
      redirect_to @item
    else
      render 'edit'
    end
end

def index
   @items = @scope.all
end

def destroy

end

 private

def item_params
   params.require(:item).permit(:name, :description, :item_pic, :category_id)
end

protected

    def determine_scope
      @scope = if params[:user_id]
        User.find(params[:user_id]).items
      else
        Item.all
      end
    end

end
