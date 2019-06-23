class PersonalController < ApplicationController
  def index
    @message = Message.new


  end


  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: "show"
    end
  end

  def show
    if Message.nil?
      index
    else
      @message = Message.order("created_at desc").limit(3)
    end

  end


  private

  def message_params

    params.require(:message).permit(:message)

  end
end
