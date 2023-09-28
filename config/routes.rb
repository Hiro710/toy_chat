Rails.application.routes.draw do
  get 'main_pages/home'
  root "application#hello"
end
