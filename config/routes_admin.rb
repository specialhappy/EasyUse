Rails.application.routes.draw do

  namespace :admin do

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

    resources :appointments do
      collection do
        get 'appointment_manage'
        get 'list_manage'
        post 'create_manage'
        post 'destroy_manage'
      end
      member do
        post 'update_manage'
      end
    end

    resources :instruments

  end

end