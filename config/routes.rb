Rails.application.routes.draw do
  root to: "dashboard#index"
  resources :transactions, only: [:index] do
  	post 'deposit', on: :collection
  	post 'withdraw', on: :collection
    get 'download', on: :collection
  end
  devise_for :users
  resources :accounts

  # It should be at the end otherwise it will hijack other's new action
  get 'users/:user_id/:transaction_type/new', to: 'transactions#new', as: 'new_member_transaction'
  get ':transaction_type/new', to: 'transactions#new', as: 'new_transaction'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
