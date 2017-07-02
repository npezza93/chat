# frozen_string_literal: true

module Chat
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception
  end
end
