# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :require_login
  before_action :set_user, only: %i(edit update)

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "User was successfully updated."
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :image, :email, :password
    )
  end
end
