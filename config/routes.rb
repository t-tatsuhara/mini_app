Rails.application.routes.draw do
  devise_for :users
  root 'comments#index'
  resources :comments, only: [:index, :new, :destroy, :edit]
  resources :users, only: :show do
    resources :comments, only: [:create, :update]
  end

end
