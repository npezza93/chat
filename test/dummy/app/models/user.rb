# frozen_string_literal: true
class User < ApplicationRecord
  include Chat::User
  include Clearance::User

  has_attached_file :image
  validates_attachment :image, content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }
end
