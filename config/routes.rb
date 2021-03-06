Rails.application.routes.draw do
  devise_for :employees, :controllers => { :invitations => 'employees/invitations' }
  devise_for :promoters, :controllers => { :omniauth_callbacks => "promoters/omniauth_callbacks" }
  get 'promoter/dashboard' => 'promoters#dashboard', as: :promoter_dashboard
  get 'employee/dashboard' => 'employees#dashboard', as: :employee_dashboard
  get 'promoter/invites/:employee' => 'promoters#invites', as: :promoter_invites
  get 'promoter/finances' => 'promoters#finances', as: :promoter_finances
  get 'employee/concert/:id' => 'employees#concert', as: :employee_concert
  resources :venues, only: [:create, :new, :show, :edit, :update]
  resources :concerts, only: [:create, :new, :show, :update, :edit, :destroy] do
    resources :expenses, only: [:new, :create, :update]
    resources :incomes, only: [:new, :create, :update]
  end
  resources :expense_categories, only: [:new, :create]
  resources :income_categories, only: [:new, :create]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
