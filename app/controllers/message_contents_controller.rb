class MessageContentsController < ApplicationController

  # 投稿一覧
  # モデルのscopeヘルパーにより、それぞれの場合の一覧の並び順を@message_contentsに代入。
  # else の結果がデフォルト(=並べ替えを選択していない時)の並び順。
  def index
    if params[:latest]
      @message_contents = MessageContent.latest
    elsif params[:old]
      @message_contents = MessageContent.old
    else
      @message_contents = MessageContent.latest
    end
  end

  def new
    @message_content = MessageContent.new
  end

  def create
  end

  # 投稿内容の詳細
  def show
    @message_content = MessageContent.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
