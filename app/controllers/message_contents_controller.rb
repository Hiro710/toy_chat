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
    @message_content = MessageContent.new(message_content_params)
    # 投稿に成功：一覧へリダイレクト、投稿失敗：新規投稿へリダイレクト
    if @message_content.save
      flash[:notice] = "投稿完了"
      redirect_to root_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      @message_contents = MessageContent.all
      redirect_to new_message_content_path
    end
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


  private

  def message_content_params
    params.require(:message_content).permit(:name, :sex, :mood, :person_type, :content)
  end
end
