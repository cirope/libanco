Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_account'
    put 'users'  => 'registrations#update', as: 'user_account'
  end

  resources :users

  constraints AdminSubdomain do
    resources :accounts
  end

  constraints AccountSubdomain do
  end

  root to: redirect('/users/sign_in')
end
