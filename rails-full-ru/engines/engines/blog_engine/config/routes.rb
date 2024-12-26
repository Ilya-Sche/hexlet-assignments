BlogEngine::Engine.routes.draw do
  resources :blogs
  root to: 'blogs#index'
end
