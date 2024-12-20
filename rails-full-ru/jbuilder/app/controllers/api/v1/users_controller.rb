# frozen_string_literal: true

class Api::V1::UsersController < Api::ApplicationController
  # BEGIN
  def index
    @users = User.all

    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
  # END
end
