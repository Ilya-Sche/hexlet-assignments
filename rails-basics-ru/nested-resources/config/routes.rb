# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :postcomments, only: %i[index new create]
  end

  resources :posts, shallow: true do
    resources :postcomments, only: %i[edit update show destroy]
  end
  # END
end
