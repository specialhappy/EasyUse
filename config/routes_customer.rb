Rails.application.routes.draw do

  get 'welcome/login'

  resources :welcome do
    collection do
      post 'validates'
      post 'search'
    end

  end
end