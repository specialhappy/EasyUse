Rails.application.routes.draw do

  namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
    resources :region_centers

    resources :institutions

    resources :time_periods

    resources :a_level_tags

    resources :b_level_tags

    resources :groups

    resources :priviliges

    resources :roles

    resources :users

    resources :working_records

    resources :operation_logs

    resources :application_forms

    resources :appointments

    resources :instruments

    require File.expand_path('../routes_admin',__FILE__)
  
  end
  
    namespace :customer do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
    resources :region_centers

    resources :institutions

    resources :time_periods

    resources :a_level_tags

    resources :b_level_tags

    resources :groups

    resources :priviliges

    resources :roles

    resources :users

    resources :working_records

    resources :operation_logs

    resources :application_forms

    resources :appointments

    resources :instruments
    
    resources :messages
    
    require File.expand_path('../routes_customer',__FILE__)

  end
  
  scope module: 'customer' do
    resources :region_centers, :institutions, :time_periods, :a_level_tags, :b_level_tags, :groups, :priviliges, :roles, :users, :working_records, :operation_logs, :application_forms, :appointments, :instruments, :messages
  end
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
