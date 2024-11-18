# frozen_string_literal: true

Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ru/ do

    root 'home#index'
    resources :posts do
      resources :comments, module: :posts, only: %i[index new create edit update destroy]
    end
  end
end
