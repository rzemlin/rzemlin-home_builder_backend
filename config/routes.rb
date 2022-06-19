Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms do
        resources :comments
        resources :rooms
      end
      resources :plans
      resources :todos
    end
  end
end
