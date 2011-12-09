class MessagesController < ApplicationController
  def index
    @message = Message.new
  end
  
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      redirect_to list_messages_path, :notice => "Successfully created message."
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user=User.find(params[:id])
    @title= "Edit User"
  end
end
