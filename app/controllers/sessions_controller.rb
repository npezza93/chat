# frozen_string_literal: true

class SessionsController < Clearance::SessionsController
  def url_after_create
    return root_path if @user.first_name? && @user.last_name? && @user.image?

    edit_users_path
  end

  def url_for_signed_in_users
    return root_path if @user.first_name? && @user.last_name? && @user.image?

    edit_users_path
  end
end
