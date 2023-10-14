Rails.application.routes.draw do
  root "main_pages#home"
  # root "message_contents#index"
  resources :message_contents, only: [:index, :show, :new, :create, :edit, :update] # , :destroy]

  get "main_pages/:id", to: "main_pages#home"
  get "message_contents/show/:id", to: "message_contents#:id"
  get "message_contents/edit/:id", to: "message_contents#edit#{:id}"
end
