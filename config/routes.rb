Rails.application.routes.draw do
 devise_for :customers, controllers: {
  sessions: "customers/sessions",
  registrations: "customers/registrations"
}
 devise_for :users,
  skip: [:registrations],
  controllers: {
    sessions: "users/sessions"
  }

  authenticated :user do
  root "admin/dashboard#index", as: :authenticated_user_root
  end

 authenticated :customer do
  root "customers/dashboard#index",
       as: :authenticated_customer_root
end

  unauthenticated do
    root to: redirect("/customers/sign_up")
  end

  namespace :admin do
    get :dashboard, to: "dashboard#index"

    resources :vehicle_categories
    resources :vehicle_brands
    resources :fuel_types
    resources :transmission_types
    resources :vehicle_colors
    resources :locations
    resources :amenities
    resources :vehicles
    resources :customers
    resources :bookings do
    member do
      patch :approve
      patch :reject
      patch :start_rental
      patch :complete_rental
    end
  end
  end

  namespace :vendor do
    get :dashboard, to: "dashboard#index"
  end

  namespace :customers do
  root "dashboard#index"

  get :dashboard, to: "dashboard#index"

  resources :vehicles, only: [:index, :show]
  resources :bookings
  resource :profile, only: [:show, :edit, :update]
  resources :wishlist, only: [:index]
end
end