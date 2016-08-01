Rails.application.routes.draw do
  devise_for :users, skip: [:registrations, :passwords]

  as :user do
    get 'users/edit' => 'devise/registrations#edit', as: 'edit_user_account'
    put 'users'  => 'registrations#update', as: 'user_account'
  end

  resources :users

  constraints AdminSubdomain do
    resources :accounts, except: [:show]
  end

  constraints AccountSubdomain do
    resources :cities, except: [:show, :destroy]
    resources :education_levels, except: [:show, :destroy]
    resources :institutions, except: [:show, :destroy]
    resources :marital_statuses, except: [:show, :destroy]
    resources :nacionalities, except: [:show, :destroy]
    resources :neighborhoods, except: [:show, :destroy]
    resources :occupations, except: [:show, :destroy]
    resources :states, except: [:show, :destroy]
  end

  root to: redirect('/users/sign_in')
end
