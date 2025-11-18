Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      # Auth (Giriş - Madde 1)
      post 'auth/login', to: 'authentication#login'

      # Courses (Listeleme - Madde 2)
      resources :courses, only: [:index, :show]

      # Lessons (Detay - Madde 4 ve Üretim - Madde 5)
      resources :lessons, only: [:show] do
        member do
          post 'generate', to: 'lessons#generate_video'
        end
      end
    end
  end
end