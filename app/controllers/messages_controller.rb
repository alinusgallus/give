class MessagesController < ApplicationController
  
  def new
    @item = Item.find(params[:item_id])
    @message = Message.new
  end

  def create
    @item = Item.find(params[:item_id])
    @message = @item.messages.build(message_params)
    @message.status = "unread"
    @message.sender_id = current_user.id
    
    if @message.save
      flash[:success] = "message has been sent"
      redirect_to @item
    else render 'new'
    end
  end

  def show
    @message=Message.find(params[:id])
  end

  

  def delete
  end

  def index
    @items=current_user.items
    @messages_collection=Array.new
    @items.each do |item|
      item.messages.each do |msg|
        @messages_collection<<msg
      end
    end
    
  end

  private 

  def message_params
    params.require(:message).permit(:sender_id, :content,:status)
  end

 

  
end
