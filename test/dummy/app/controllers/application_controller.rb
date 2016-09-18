class ApplicationController < ActionController::Base
  include Clearance::Controller
  helper Chat::Engine.helpers
  protect_from_forgery with: :exception
end
