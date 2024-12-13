# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include AuthConcern
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  helper_method :current_user

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to posts_path and return 
  end

  def current_user
    return unless session[:user_id]
    @user = User.find(session[:user_id])
  end
end
