Rails.application.routes.draw do
  root "main_pages#home"
  # root "message_contents#index"
  resources :message_contents, only: [:index, :show, :new, :create, :edit, :update] # , :destroy]

  get "main_pages/:id", to: "main_pages#home"

  get "/explanation", to: "message_contents#explanation"
end
