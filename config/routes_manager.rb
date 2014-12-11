Rails.application.routes.draw do

  namespace :manager do
    
    get 'welcome/index'
    post 'welcome/validate'
    
    resources :a_level_tags
    
    resources :b_level_tags
    
    resources :institutions
    
    resources :region_centers
    
    resources :users
    
    resources :check_rules do
    member do
        get 'enable'
      end
      member do
        get 'disable'
      end
end
    
  end
  
end