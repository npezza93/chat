require "chat/engine"
require "chat/version"
require "chat/user"

require "paperclip"
require "material_icons"
require "coffee-rails"
require "jquery-rails"
require "composite_primary_keys"
require "jquery-fileupload-rails"

module Chat
  # The helper method  used to distinguish if a user is logged in
  mattr_accessor :signed_in

  def self.table_name_prefix
    "chat_"
  end

  def self.setup
    yield self
  end
end
