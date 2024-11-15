# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts do
    resources :postcomments
  end
end
