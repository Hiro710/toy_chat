class MainPagesController < ApplicationController
  def home
    # @message_contents = MessageContent.all

    if params[:latest]
      @message_contents = MessageContent.latest
    elsif params[:old]
      @message_contents = MessageContent.old
    else
      @message_contents = MessageContent.latest
    end
  end
end
