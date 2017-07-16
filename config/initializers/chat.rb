# frozen_string_literal: true

Chat.setup do |config|
  config.signed_in = :signed_in?
  config.logged_in_check = :require_login
  config.user_avatar = :image
  config.perform_method = :perform_now
end
