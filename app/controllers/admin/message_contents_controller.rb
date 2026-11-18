class Admin::MessageContentsController < Admin::BaseController
  def index
    @message_contents = MessageContent.latest.search(params[:q]).page(params[:page]).per(100)
  end

  def edit
    @message_content = MessageContent.find(params[:id])
    set_category_options
  end

  def update
    @message_content = MessageContent.find(params[:id])
    if @message_content.update(admin_message_content_params)
      flash[:notice] = "投稿を更新しました"
      redirect_to admin_message_contents_path
    else
      set_category_options
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @message_content = MessageContent.find(params[:id])
    @message_content.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to admin_message_contents_path
  end

  private

  def admin_message_content_params
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
