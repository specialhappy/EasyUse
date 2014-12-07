Rails.application.routes.draw do

  namespace :manager do
    
    resources :a_level_tags
    
    resources :b_level_tags
    
    resources :institutions
    
    resources :region_centers
    
    resources :users
    
    resources :check_rules
    
  end
  
end