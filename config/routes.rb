Rails.application.routes.draw do
  root to:'pages#home'

  resources :gardens do
    collection do
      get :top  # Get all the gardens rated 5 stars : gardens/top
      end

    member do
      get :gardener # Get the gardener of one garden : gardens/:id/gardener
      end

    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only:[:destroy]

  # Static pages

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
