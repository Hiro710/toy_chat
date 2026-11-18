class Admin::SessionsController < ApplicationController
  layout "admin"

  def new
  end

  def create
    admin = Admin.find_by(username: params[:username].to_s.strip)
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      flash[:notice] = "ログインしました"
      redirect_to admin_root_path
    else
      flash.now[:alert] = "ユーザー名またはパスワードが違います"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:admin_id)
    flash[:notice] = "ログアウトしました"
    redirect_to new_admin_session_path
  end
end
