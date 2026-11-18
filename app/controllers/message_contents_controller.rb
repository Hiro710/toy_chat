class MessageContentsController < ApplicationController
  before_action :require_post_verification, only: [:edit, :update]

  def index
    @message_contents = base_query.search(params[:q]).page(params[:page]).per(100)
  end

  def new
    @message_content = MessageContent.new
    set_category_options
  end

  def create
    @message_content = MessageContent.new(message_content_params)
    if @message_content.save
      flash[:notice] = "投稿完了"
      redirect_to message_contents_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      set_category_options
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @message_content = MessageContent.find(params[:id])
  end

  def edit
    set_category_options
  end

  def update
    if @message_content.update(message_content_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to message_contents_path
    else
      set_category_options
      render :edit, status: :unprocessable_entity
    end
  end

  def explanation
  end

  private

  def base_query
    if params[:old]
      MessageContent.old
    else
      MessageContent.latest
    end
  end

  def require_post_verification
    @message_content = MessageContent.find(params[:id])
    return if @message_content.password_digest.nil?
    return if post_verified?(@message_content.id)
    flash[:alert] = "編集にはパスワードが必要です"
    redirect_to new_message_content_password_verification_path(@message_content)
  end

  def message_content_params
    params.require(:message_content).permit(:name, :sex, :mood, :person_type, :content,
                                            :password, :password_confirmation)
  end

  def set_category_options
    @category_sex = [" ", "おじさん", "紳士", "青年", "男", "Hな男性", "女装", "Hな女装", "男の娘", "NH", "レイヤー",
                     "熟女装", "メス豚", "秘密"]

    @category_mood = [" ", "秘密", "普通", "Hしたい!", "妊娠中", "疲れ気味", "お話したい♪", "ブルーなの..", "口説いて♪",
                      "パートナー募集中", "ドキドキ", "ハラハラ", "初めてです", "発情期♪", "生理中", "声かけて", "いじめて♪", "内気です",
                      "仲良くなりたい", "良い方がいれば♪"]

    @category_person_type = [" ", "男性", "女性", "女装", "変態", "皆大好き", "可愛い娘", "ガチムチ", "優しい人", "長身な人",
                             "ドS", "ドM", "小柄な人", "イケメン", "おじさん", "お兄さん", "H好きな人", "スリム体型", "特になし", "H上手な人"]
  end
end
