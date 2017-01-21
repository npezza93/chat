# frozen_string_literal: true
class ApplicationController < ActionController::Base
  helper Chat::Engine.helpers
  include Clearance::Controller
  protect_from_forgery with: :exception
end
