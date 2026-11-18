class ApplicationController < ActionController::Base
  helper_method :admin_logged_in?, :current_admin, :post_verified?

  private

  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id])
  end

  def admin_logged_in?
    current_admin.present?
  end

  def require_admin_login
    unless admin_logged_in?
      flash[:alert] = "管理者ログインが必要です"
      redirect_to new_admin_session_path
    end
  end

  def verified_post_ids
    session[:verified_post_ids] ||= []
  end

  def post_verified?(post_id)
    verified_post_ids.include?(post_id.to_i)
  end
end
