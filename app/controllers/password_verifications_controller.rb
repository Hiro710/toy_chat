class PasswordVerificationsController < ApplicationController
  before_action :set_post

  def new
  end

  def create
    if @post.authenticate(params[:password])
      session[:verified_post_ids] = verified_post_ids | [@post.id]
      flash[:notice] = "パスワードが確認されました。編集できます。"
      redirect_to edit_message_content_path(@post)
    else
      flash.now[:alert] = "パスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = MessageContent.find(params[:message_content_id])
  end
end
