class MainPagesController < ApplicationController
  def home
    @message_contents = base_query.search(params[:q]).page(params[:page]).per(100)
  end

  private

  def base_query
    if params[:old]
      MessageContent.old
    else
      MessageContent.latest
    end
  end
end
