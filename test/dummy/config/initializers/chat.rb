# frozen_string_literal: true

Chat.setup do |config|
  # Clearance => :signed_in?
  # Devise    => :user_signed_in?
  config.signed_in = :signed_in?

  # Clearance => :require_login
  # Devise    => :authenticate_user!
  config.logged_in_check = :require_login

  config.user_avatar = :image

  config.perform_method = :perform_now
end
