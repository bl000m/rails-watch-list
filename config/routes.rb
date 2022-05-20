Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get 'lists', to: 'lists#index'
# get 'lists/:id', to: 'lists#show', as: :list
# get 'lists/new', to: 'lists#new', as: :new_list
# post 'restaurants', to: 'lists#create'

# root :to => 'lists#index'
root to: 'lists#index'

  resources :lists, only: %i[create show new] do
    resources :bookmarks, only: %i[create new]
  end
  resources :bookmarks, only: :destroy
end
