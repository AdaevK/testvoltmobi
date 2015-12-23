Rails.application.routes.draw do
  root to: 'tasks#index'
  devise_for :users
end
