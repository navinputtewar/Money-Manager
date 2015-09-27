Rails.application.routes.draw do

  get 'reports/by_category'

  get 'reports/by_date_range'

  devise_for :users, controllers: { 
                                    sessions: "users/sessions",
                                    registrations: "users/registrations",
                                    passwords: "users/passwords",
                                    confirmations: "users/confirmations"
                                  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  get 'incomes/index', to: 'incomes#index', as: 'incomes_index'

  get 'incomes/new', to: 'incomes#new', as: 'incomes_new'

  post 'incomes/create', to: 'incomes#create', as: 'incomes_create'

  get 'incomes/show/:id', to: 'incomes#show', as: 'incomes_show'

  get 'incomes/edit/:id', to: 'incomes#edit', as: 'incomes_edit'

  patch 'incomes/update/:id', to: 'incomes#update', as: 'incomes_update'

  delete 'incomes/destroy', to: 'incomes#destroy', as: 'incomes_destroy'


  get 'dashboard/index'


  get 'expences/index', to: 'expences#index', as: 'expences_index'

  get 'expences/new', to: 'expences#new', as: 'expences_new'

  post 'expences/create', to: 'expences#create', as: 'expences_create'

  get 'expences/show/:id', to: 'expences#show', as: 'expences_show'

  get 'expences/edit', to: 'expences#edit', as: 'expences_edit'

  patch 'expences/update', to: 'expences#update', as: 'expences_update'

  delete 'expences/destroy', to: 'expences#destroy', as: 'expences_destroy'
  

  get 'expence_category/index', to: 'expence_category#index', as: 'expence_category_index'

  get 'expence_category/new', to: 'expence_category#new', as: 'expence_category_new'

  post 'expence_category/create', to: 'expence_category#create', as: 'expence_category_create'

  get 'expence_category/show/:id', to: 'expence_category#show', as: 'expence_category_show'

  get 'expence_category/edit/:id', to: 'expence_category#edit', as: 'expence_category_edit'

  patch 'expence_category/update/:id', to: 'expence_category#update', as: 'expence_category_update'

  delete 'expence_category/destroy', to: 'expence_category#destroy', as: 'expence_category_destroy'


  get 'income_category/index', to: 'income_category#index', as: 'income_category_index'

  get 'income_category/new', to: 'income_category#new', as: 'income_category_new'

  post 'income_category/create', to: 'income_category#create', as: 'income_category_create'

  get 'income_category/show/:id', to: 'income_category#show', as: 'income_category_show'

  get 'income_category/edit/:id', to: 'income_category#edit', as: 'income_category_edit'

  patch 'income_category/update/:id', to: 'income_category#update', as: 'income_category_update'

  delete 'income_category/destroy', to: 'income_category#destroy', as: 'income_category_destroy'


  resources :incomes do 
    resources :transactions

  end


  resources :expences do 
    resources :transactions
  end

  resources :transactions

   get 'expences/transactions/index', to: 'transactions#index', as: 'expence_transactions_path'

   get 'incomes/transactions/index', to: 'transactions#index', as: 'incomes_transactions_path'




  # get 'bank_statements/new'

  # get 'bank_statements/create'

  # get 'bank_statements/edit'

  # get 'bank_statements/update'

  # get 'bank_statements/destroy'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
