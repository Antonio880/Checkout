Rails.application.routes.draw do
  devise_for :admin_users, path: 'admin', controllers: { sessions: 'admin/sessions' }

  namespace :admin do
    root to: "dashboard#index"
    
    resources :dashboard, only: [:index]
    resources :courses
    resources :sales, only: [:index, :show]
  end

end
