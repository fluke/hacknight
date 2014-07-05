Hacknight::Application.routes.draw do
  get "dashboard/index", as: "dashboard"
  get "vibe/test", as: "test"
  get "docspad", to:"resumes#docspad", as: "docspad"
  get "/resumes/:id/qcard_step2", to: "resumes#qcard_step2", as: "qcard_step2"
  get "/resumes/:id/qcard", to: "resumes#qcard", as: "qcard_resume"
  get "/resumes/:id/card_print", to: "resumes#printcard", as: "card_print"
  get "/resumes/:id/print", to: "resumes#print", as: "print_resume"
  get 'random_json', to: "resumes#random_json", as: "random_json"
  devise_for :users
  resources :resumes
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
