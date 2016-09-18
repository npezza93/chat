Rails.application.routes.draw do
  mount Chat::Engine => "/chat", as: "chat"

  root to: 'high_voltage/pages#show', id: 'home'

  resource :users, only: [:edit, :update]
end
