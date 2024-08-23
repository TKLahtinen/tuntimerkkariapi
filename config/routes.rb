Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :projects, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:index, :create, :update, :destroy]
  end

  

end
