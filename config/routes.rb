Rails.application.routes.draw do
  root "main_pages#home"
  resources :message_contents, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  get 'message_contents/show'
  get 'message_contents/index'
end
