Rails.application.routes.draw do

  namespace :maintainer do
    
    get 'welcome/index'
    post 'welcome/validate'
    
    resources :appointments do
      member do
        get 'check'
      end
    end
    
    resources :instruments
    
  end
  
end