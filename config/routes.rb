GenericMap::Application.routes.draw do
  resources :users

  resources :organizations, path: 'orgs' do
    resources :users, controller: 'organizations_users'
    resources :geojson_layers
    resources :wms_layers

    resources :multimaps do
      get :available, on: :member
      patch :add, on: :member
      patch :remove, on: :member
      patch :activate, on: :member
    end

    resources :maps do
      get :available_geojson, on: :member
      get :available_wms, on: :member
      patch :add_geojson, on: :member
      patch :add_wms, on: :member
      patch :remove_geojson, on: :member
      patch :remove_wms, on: :member
    end
  end

  # resources :maps do
  #   resources :geojson_layers, only: [:index] do
  #     patch :remove, on: :member
  #     patch :add, on: :member
  #   end
  #
  #   resources :wms_layers, only: [:index] do
  #     patch :remove, on: :member
  #     patch :add, on: :member
  #   end
  #   get :available_geojson_layers_for, on: :member
  #   get :available_wms_layers_for, on: :member
  #   # patch :add_layer, on: :member
  #   # patch :remove_layer, on: :member
  # end

  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  get '/auth/:provider/disable', to: 'users#disable_provider'
  post '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/', to: 'organizations#index', as: :permission_denied

  resources :sessions
  resources :memberships

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  get '/:id' => 'viewer#show', as: :viewer

  # You can have the root of your site routed with "root"
  root 'organizations#index'

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
