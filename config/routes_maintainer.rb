Rails.application.routes.draw do

  namespace :maintainer do
    
    resources :appointments do
      member do
        get 'check'
      end
    end
    
    resources :instruments
    
  end
  
end