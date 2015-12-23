Rails.application.routes.draw do
  root to: 'tasks#index'

  devise_for :users, skip: [:registration, :password], path_names: { sign_in: 'login', sign_out: 'logout' }, path: ''
end
