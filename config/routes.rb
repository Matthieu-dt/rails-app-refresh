Rails.application.routes.draw do
  root to:'pages#home'

  resources :gardens do
    collection do
      get :top
      end
    end

  # #Create a garden
  # get 'gardens/new' to: 'gardens#new'
  # post 'gardens' to: 'gardens#create'

  # #Get all gardens
  # get 'gardens' to: 'gardens#index'

  # #Get all garden
  # get 'gardens/:id' to: 'gardens#show'

  # #Update a garden
  # get 'gardens/:id/edit' to: 'gardens#edit'
  # patch 'gardens/:id' to: 'gardens#update'

  # #Delete a garden

  # delete 'gardens/:id' to 'gardens#destroy'

  # Static pages

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
