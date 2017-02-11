Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :users, only: [:show, :update, :destroy] do
    resources :task_lists, controller: 'users/task_lists' do
      member do
        patch 'toggle_bookmark'
      end
      resources :tasks, controller: 'users/task_lists/tasks', only: [:index, :update, :create, :destroy]
    end
  end

  #public task lists
  resources :public_task_lists, only: [:index, :show] do
    member do
      patch 'toggle_bookmark'
    end
  end
end
