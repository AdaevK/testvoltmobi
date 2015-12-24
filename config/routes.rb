Rails.application.routes.draw do
  root to: 'tasks#index'

  devise_for :users, skip: [:registration, :password], path_names: { sign_in: 'login', sign_out: 'logout' }, path: ''

  namespace :account do
    resources :tasks do
      member do
        patch :changed_state
      end
    end
  end
end
