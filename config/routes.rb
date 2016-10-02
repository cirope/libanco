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
    resources :advisers, except: [:destroy]
    resources :body_templates, except: [:destroy]
    resources :cards, except: [:show, :destroy]
    resources :cities, except: [:show, :destroy]
    resources :credit_lines, except: [:show, :destroy]
    resources :custom_templates
    resources :customers, except: [:destroy] do
      resources :custom_templates, only: [] do
        scope module: 'custom_templates' do
          resource :generate, only: [:show]
        end
      end
    end
    resources :education_levels, except: [:show, :destroy]
    resources :footer_templates, except: [:destroy]
    resources :header_templates, except: [:destroy] do
      get :image, on: :member
    end
    namespace :loans do
      get 'simulator', to: 'simulator#index', as: 'simulator'
    end
    resources :loans do
      resources :payments, only: [:edit, :update]
    end
    resources :marital_statuses, except: [:show, :destroy]
    resources :nacionalities, except: [:show, :destroy]
    resources :neighborhoods, except: [:show, :destroy]
    resources :occupations, except: [:show, :destroy]
    resources :relationships, except: [:show, :destroy]
    resources :states, except: [:show, :destroy] do
      resources :cities, only: [:index]
    end
    resources :workgroups, except: [:show, :destroy]
  end

  root to: redirect('/users/sign_in')
end
