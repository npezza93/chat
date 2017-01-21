# frozen_string_literal: true
module Chat
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  end
end
