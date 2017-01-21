# frozen_string_literal: true
Rails.application.routes.draw do
  mount Chat::Engine => "/chat", as: "chat"
  root to: "home#index", id: "home"

  resource :users, only: [:edit, :update]

  mount ActionCable.server => "/cable"
end
