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
=begin
    @category_sex = [{id: 1, sex_name: "選択して下さい"}, {id: 2, sex_name: "おじさん"}, {id: 3, sex_name:"紳士"},
       {id: 4, sex_name: "青年"}, {id: 5, sex_name: "男"}, {id: 6, sex_name: "Hな男性"}, {id: 7, sex_name: "女装"},
       {id: 8, sex_name: "Hな女装"}, {id: 9, sex_name: "男の娘"}, {id: 10, sex_name: "NH"}, {id: 11, sex_name: "レイヤー"},
       {id: 12, sex_name: "熟女装"}, {id: 13, sex_name: "メス豚"}, {id: 14, sex_name: "秘密"}] #:selected => "選択して下さい"]
=end

    # Viewの方でselectメソッドを使ってプルダウンメニューを表示させる
    @category_sex = ["選択して下さい", "おじさん", "紳士", "青年", "男", "Hな男性", "女装", "Hな女装", "男の娘", "NH", "レイヤー",
                     "熟女装", "メス豚", "秘密"]

    @category_mood = ["選択して下さい", "秘密", "普通", "Hしたい!", "妊娠中", "疲れ気味", "お話したい♪", "ブルーなの..", "口説いて♪",
                      "パートナー募集中", "ドキドキ", "ハラハラ", "初めてです", "発情期♪", "生理中", "声かけて", "いじめて♪", "内気です",
                      "仲良くなりたい", "良い方がいれば♪"]

    @category_person_type = ["選択して下さい", "男性", "女性", "女装", "変態", "皆大好き", "可愛い娘", "ガチムチ", "優しい人", "長身な人",
                             "ドS", "ドM", "小柄な人", "イケメン", "おじさん", "お兄さん", "H好きな人", "スリム体型", "特になし", "H上手な人"]
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
