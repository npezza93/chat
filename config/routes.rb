# frozen_string_literal: true

Rails.application.routes.draw do
  mount Chat::Engine => "/chat", as: "chat"
  root to: "home#index", id: "home"

  resource :users, only: %i(edit update)

  mount ActionCable.server => "/cable"

  resources :passwords, controller: "clearance/passwords", only: %i(create new)
  resource :session, controller: :sessions, only: :create

  resources :users, controller: "clearance/users", only: :create do
    resource :password, controller: "clearance/passwords",
                        only: %i(create edit update)
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
end
