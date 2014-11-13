Rails.application.routes.draw do

  namespace :admin do

    get 'manage/index'
    get 'manage/login'
    get 'manage/logout'
    post 'manage/validate'

    resources :region_centers do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :institutions do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :time_periods

    resources :a_level_tags do
            collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :b_level_tags do
            collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :groups do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :priviliges do
            collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :roles do
            collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :users do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :working_records

    resources :operation_logs

    resources :application_forms

    resources :appointments do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

    resources :instruments do
      collection do
        get 'list'
        post 'delete'
      end
      member do
        post 'modify'
      end
    end

  end

end