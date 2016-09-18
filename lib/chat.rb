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
  def self.table_name_prefix
    "chat_"
  end
end
