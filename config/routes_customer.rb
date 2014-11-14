Rails.application.routes.draw do

  get 'payment/pay'
  get 'payment/pay_success'
  get 'terminal/login'
  get 'terminal/index'
  post 'terminal/validates'

  resources :welcome do
    collection do
      post 'validates'
      post 'search'
      get 'logout'
      get 'login'
    end

  end
end