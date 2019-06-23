class DevelopersController < ApplicationController

  def index
    @developer = Developer.new

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
      @developer = Developer.find(params[:id])


    end
  end

  #
  #
  def new

    @developer = Developer.new


  end


  def create
    @developer = Developer.new(message_params)
    if @developer.save

      redirect_to '/developers/new/'
    else
      render 'new'
    end

  end


  private

  def message_params

    params.require(:developer).permit(:name, :email, :message)

  end


end


