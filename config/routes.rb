Rails.application.routes.draw do
  resources :produtos
  resources :pedidos
  resources :funcionarios
  resources :fornecedors
  resources :componentes_produtos
  resources :comandas
  get 'sessions/new'

  root                'static_pages#home'
  get    'home'    => 'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  #get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'logout'  => 'sessions#destroy'

  #routing compra_controller.rb
  get 'compra/item_index', to: 'compra#item_index', as: :item_index
  post 'compra/item(/:id)', to: 'compra#item_create'
  patch 'compra/item/:id', to: 'compra#item_update'
  get 'compra/item(/:id)', to: 'compra#item_show', as: :item_show
  get 'compra/item_new', to: 'compra#item_new', as: :item_new
  get 'compra/item/:id/edit', to: 'compra#item_edit', as: :item_edit
  delete 'compra/item/:id', to: 'compra#item_destroy', as: :item_delete

  get 'compra/vende_index', to: 'compra#index', as: :vende_index
  post 'compra/vende((/:id1)(/:id2)(/:id3))', to: 'compra#create'
  patch 'compra/vende/:id1/:id2/:id3', to: 'compra#update'
  get 'compra/vende((/:id1)(/:id2)(/:id3))', to: 'compra#show', as: :vende_show
  get 'compra/vende_new', to: 'compra#new', as: :vende_new
  get 'compra/vende/:id1/:id2/:id3/edit', to: 'compra#edit', as: :vende_edit
  delete 'compra/vende/:id1/:id2/:id3', to: 'compra#destroy', as: :vende_delete
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
