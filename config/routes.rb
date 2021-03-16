Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :categories, :users, :test_passages
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[index show] do
    member do
      get :result
    end
  end
end
