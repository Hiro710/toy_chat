class MessageContentsController < ApplicationController
  # 投稿内容の詳細
  def show
    @message_content = MessageContent.find(params[:id])
  end
end
