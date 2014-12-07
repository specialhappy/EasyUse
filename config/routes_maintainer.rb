Rails.application.routes.draw do

  namespace :maintainer do
    
    resources :appointments
    
    resources :instruments
    
  end
  
end