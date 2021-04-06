Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: :sessions }

  resources :test_passages

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[index show] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    root to: '/admin/tests#index'
    resources :categories
    resources :gists, only: :index
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true
      end
    end
  end
end
