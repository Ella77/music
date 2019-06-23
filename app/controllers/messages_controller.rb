class MessagesController < ApplicationController

  def index
    if Message.nil?
      new
    else
      @messages = Message.all.order("created_at desc").limit(3)
    end

  end

  #
  # def index
  #   @message = Message.new
  #
  #
  # end
  #
  #
  #
  def show

    if params[:id]
      @message = Message.find(params[:id])


    end
  end

  #
  #
  def new

    @message = Message.new
    if Message.nil?
      new
    else

      @messages = Message.all.order("created_at desc").limit(5)
    end


  end


  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to '/messages/new/'
    else
      render 'new'
    end

  end


  private

  def message_params

    params.require(:message).permit(:message)

  end


end


