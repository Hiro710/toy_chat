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

  # 投稿用フォームの雛形生成
  def new
    @message_content = MessageContent.new
    set_category_options
  end

  # 新規投稿
  def create
    @message_content = MessageContent.new(message_content_params)
    # 投稿に成功：一覧へリダイレクト、投稿失敗：新規投稿フォームを再表示
    if @message_content.save
      flash[:notice] = "投稿完了"
      # redirect_to @message_content
      redirect_to message_contents_path
    else
      flash.now[:alert] = "投稿に失敗しました"
      @message_contents = MessageContent.all
      set_category_options
      render :new, status: :unprocessable_entity
    end
  end

  # 投稿内容の詳細
  def show
    @message_content = MessageContent.find(params[:id])
  end

  # 投稿内容の編集
  def edit
    @message_content = MessageContent.find(params[:id])
    set_category_options
  end

  # 投稿内容の編集をデータベースへ保存して更新
  def update
    @message_content = MessageContent.find(params[:id])
    if @message_content.update(message_content_params)
      flash[:notice] = "投稿内容を更新しました"
      redirect_to message_contents_path
    else
      set_category_options
      render :edit, status: :unprocessable_entity
    end
  end

  # TOYBOXへ初来店者向け静的ページ
  def explanation
  end

  private

  # ストロングパラメータ(指定したカラムのデータしか受け付けないようにする処理)
  def message_content_params
    params.require(:message_content).permit(:name, :sex, :mood, :person_type, :content)
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
