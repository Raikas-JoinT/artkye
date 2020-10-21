class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all.order(created_at: "DESC")
    @image_urls = Message.all.with_attached_image
    @image_urls = @image_urls.map { |image_url| image_url.as_json.merge({ image_url: url_for(image_url.image) })}
    # @image_urls = @image_urls.map {|image_url| image_url[:image_url]}
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
