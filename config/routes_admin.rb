Rails.application.routes.draw do

  namespace :admin do
    
    get 'manage/index'

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

  end

end