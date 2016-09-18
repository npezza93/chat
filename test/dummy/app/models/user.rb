class User < ApplicationRecord
  include Clearance::User
  include Chat::User

  has_attached_file :image
  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }
end
