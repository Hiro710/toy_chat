Rails.application.routes.draw do
  get 'message_contents/show'
  root "main_pages#home"
  resources :message_contents
end
