Rails.application.routes.draw do

  get 'payment/pay'
  get 'payment/pay_success'

  resources :welcome do
    collection do
      post 'validates'
      post 'search'
      get 'logout'
      get 'login'
    end

  end
end