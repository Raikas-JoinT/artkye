class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all.order(created_at: "DESC")
    @image_urls = Message.all.with_attached_image
    test = []
    @image_urls.each do |image_url|
      if image_url.image.attached?
        test << image_url.as_json.merge({ image_url: url_for(image_url.image) })
      end
    end
    @image_urls = test
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
