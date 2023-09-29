Rails.application.routes.draw do
  get 'message_contents/show'
  root "main_pages#home"
end
