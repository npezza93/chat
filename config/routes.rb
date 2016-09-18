Chat::Engine.routes.draw do
  resources :conversations, only: [:show, :create] do
    resources :messages, only: [:create, :destroy]
  end
end
