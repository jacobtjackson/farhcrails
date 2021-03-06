class MessagesController < ApplicationController
  def new
    @message = Message.new

  end

  def create
    @message = Message.new(message_params)

    if verify_recaptcha(model: @message) && @message.valid?
      MessageMailer.new_message(@message).deliver
      MessageMailer.auto_response(@message).deliver
      redirect_to home_index_path, notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def message_params
    params.require(:message).permit(:name, :email, :state, :content)
  end
end
