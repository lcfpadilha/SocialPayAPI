Rails.application.routes.draw do
  # Pagamentos
  get 'pay/checkout'  => 'pay#checkout', as: 'checkout'
  get 'pay/card_register'  => 'pay#card_register', as: 'card_register'
  get 'pay/success'  => 'pay#success', as: 'success'
  get 'pay/error' => 'pay#error', as: 'error'
  get 'pay/after_pay'  => 'pay#after_pay', as: 'after_pay'

  post 'pay/save_card_info' => 'pay#save_card_info', as: "save_card_info"
  post 'pay/payment' => 'pay#payment', as: "payment"
  post 'pay' => 'pay#enter', as: "enter"


  # Instituições
  post 'instituition' => 'instituition#create', as: 'instituitions'

  get 'instituitions' => 'instituition#index', as: 'all_instituitions'

  get 'instituition/new' => 'instituition#new', as: 'institutions'

  get 'instituition/:id' => 'instituition#show', as: 'show_instituition'

  # Empresas
  post 'company'    => 'company#create', as: 'companies'

  get 'company/new' => 'company#new', as: 'new_company'

  # graph api
  get 'graph' => 'client#graph'

  # Facebook autenticação
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]

  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

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
