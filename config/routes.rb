Rails.application.routes.draw do

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

  delete 'incomes/destroy/:id', to: 'incomes#destroy', as: 'incomes_destroy'


  get 'dashboard/index'


  get 'expences/index', to: 'expences#index', as: 'expences_index'

  get 'expences/new', to: 'expences#new', as: 'expences_new'

  post 'expences/create', to: 'expences#create', as: 'expences_create'

  get 'expences/show/:id', to: 'expences#show', as: 'expences_show'

  get 'expences/edit/:id', to: 'expences#edit', as: 'expences_edit'

  patch 'expences/update/:id', to: 'expences#update', as: 'expences_update'

  delete 'expences/destroy/:id', to: 'expences#destroy', as: 'expences_destroy'
  

  get 'expence_category/index', to: 'expence_category#index', as: 'expence_category_index'

  get 'expence_category/new', to: 'expence_category#new', as: 'expence_category_new'

  post 'expence_category/create', to: 'expence_category#create', as: 'expence_category_create'

  get 'expence_category/show/:id', to: 'expence_category#show', as: 'expence_category_show'

  get 'expence_category/edit/:id', to: 'expence_category#edit', as: 'expence_category_edit'

  patch 'expence_category/update/:id', to: 'expence_category#update', as: 'expence_category_update'

  delete 'expence_category/destroy/:id', to: 'expence_category#destroy', as: 'expence_category_destroy'


  get 'income_category/index', to: 'income_category#index', as: 'income_category_index'

  get 'income_category/new', to: 'income_category#new', as: 'income_category_new'

  post 'income_category/create', to: 'income_category#create', as: 'income_category_create'

  get 'income_category/show/:id', to: 'income_category#show', as: 'income_category_show'

  get 'income_category/edit/:id', to: 'income_category#edit', as: 'income_category_edit'

  patch 'income_category/update/:id', to: 'income_category#update', as: 'income_category_update'

  delete 'income_category/destroy/:id', to: 'income_category#destroy', as: 'income_category_destroy'


  resources :incomes do 
    resources :transactions

  end


  resources :expences do 
    resources :transactions
  end

  resources :transactions

  get 'reports/by_category'

  get 'reports/by_date_range'

  get 'reports/by_week'

  get 'user_manual/about_us'

  get 'user_manual/contact_us'

  get 'user_manual/help'


end
