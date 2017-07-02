# frozen_string_literal: true

Chat::Engine.routes.draw do
  resources :conversations, only: %i(show create) do
    resources :messages, only: %i(create destroy)
  end
end
