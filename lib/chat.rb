require "chat/engine"
require "chat/version"
require "chat/user"

require "paperclip"
require "material_icons"
require "coffee-rails"
require "jquery-rails"
require "composite_primary_keys"
require "jquery-fileupload-rails"
require "giphy"
require "sidekiq"

module Chat
  # The helper method  used to distinguish if a user is logged in
  mattr_accessor :signed_in

  # The before_action method to validate users are logged in
  mattr_accessor :logged_in_check

  # The field that contains the users avatar
  mattr_accessor :user_avatar

  def self.table_name_prefix
    "chat_"
  end

  def self.setup
    yield self
  end
end
