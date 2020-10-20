class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all.order(created_at: "DESC")
    # @message = Message.new
    # @messages = @message.message.includes(:user)
  end

  def create
    Message.create(message_params)
    redirect_to messages_path
  end

  private
  def message_params
    params.require(:message).permit(:message, :image).merge(user_id: current_user.id)
  end
end
