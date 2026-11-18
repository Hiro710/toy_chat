Rails.application.routes.draw do
  root "main_pages#home"

  resources :message_contents, only: [:index, :show, :new, :create, :edit, :update] do
    resource :password_verification, only: [:new, :create]
  end

  get "main_pages/:id", to: "main_pages#home"
  get "/explanation", to: "message_contents#explanation"

  namespace :admin do
    root "message_contents#index"
    resource  :session,          only: [:new, :create, :destroy]
    resources :message_contents, only: [:index, :edit, :update, :destroy]
  end
end
