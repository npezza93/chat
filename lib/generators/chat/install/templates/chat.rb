Chat.setup do |config|
  # Clearance => :signed_in?
  # Devise    => :user_signed_in?
  config.signed_in = :signed_in?
end
