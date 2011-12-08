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
      redirect_to root_url, :notice => "Successfully created message."
    else
      render :action => 'new'
    end
  end
end
