Rails.application.routes.draw do
  resources :lppi_remarks
  get 'quote_item/approve'
  get 'quote_item/deny'
  get 'quote_item/pending'
  resources :lppi_rates
  resources :cooperative_matrices
  resources :actuarial_matrix_lppis
  resources :rider_adbs
  resources :rider_add_tpds
  resources :quotes 
  resources :lppi_coverage_items
  resources :rates
  resources :lppi_coverages
  resources :batches
  resources :products
  resources :employee_profiles
  resources :employee_users
  resources :departments
  resources :divisions do 
    get :selected, on: :member
  end
  resources :beneficiaries
  resources :members
  resources :cooperative_branches  do 
    get :selected, on: :member
  end
  resources :cooperatives do 
    get :selected, on: :member
    collection { post :import }
  end
  resources :posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "pages#home"
end
