Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  get "dreams/new_audio", to: "dreams#new_audio", as: :create_new_audio
  post "dreams/new_audio", to: "dreams#new_audio", as: :new_audio_dreams

  resources :questions
  resources :answers, only: [:create, :update ]
  resources :dream_questions
  resources :dreams do
    collection do
      get :analytics
    end
    member do
      post :new_answered_questions
    end
  end
  resources :labels
end
