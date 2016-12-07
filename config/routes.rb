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
    get 'customers/searches', to: 'customers/searches#index', as: 'customers_searches'
    get 'reports', to: 'reports#index', as: 'reports'
    get '/schedules(/:date)', to: 'schedules#index', as: 'schedules', constraints: { date: /\d{4}\/\d{2}\/\d{2}/ }
    get '/schedules/new(/:date)', to: 'schedules#new', as: 'new_schedule', constraints: { date: /\d{4}-\d{2}-\d{2}/ }
    get 'employees/searches', to: 'employees/searches#index', as: 'employees_searches'
    get 'suppliers/searches', to: 'suppliers/searches#index', as: 'suppliers_searches'
    resources :schedules, only: [:create, :edit, :update] do
      patch 'mark_as_done', to: 'schedules#mark_as_done', as: 'mark_as_done', on: :member
    end
    resources :advisers, except: [:show, :destroy]
    resources :body_templates, except: [:destroy]
    resources :cards, except: [:show, :destroy]
    resources :cashes do
      scope module: 'cashes' do
        resources :cash_employees, except: [:show]
        resources :cash_invoices, except: [:show]
        resources :cash_member_payments, except: [:show, :edit, :update]
        resources :cash_payments, except: [:show, :edit, :update]
        resources :cash_vouchers, except: [:show]
        resources :flows, only: [:index]
        resource :counts, only: [:edit, :update]
        resource :lock, only: [:update, :destroy]
      end
    end
    resources :cities, except: [:show, :destroy]
    resources :credit_lines, except: [:show, :destroy]
    resources :custom_templates
    resources :customers, except: [:destroy] do
      resources :custom_templates, only: [] do
        scope module: 'custom_templates' do
          resource :generate, only: [:show]
        end
      end
      resources :loans, only: [:index]
    end
    resources :customers, only: [] do
      resources :schedules, only: [:new, :create, :edit, :update]
      resources :member_payments, only: [:index]
      resources :payments, only: [:index]
    end
    resources :education_levels, except: [:show, :destroy]
    resources :employees, except: [:show, :destroy]
    resources :expense_types, except: [:show, :destroy]
    resources :footer_templates, except: [:destroy]
    resources :header_templates, except: [:destroy] do
      get :image, on: :member
    end
    resources :invoice_types, except: [:show, :destroy]
    namespace :loans do
      get 'simulator', to: 'simulator#index', as: 'simulator'
    end
    resources :loans
    resources :marital_statuses, except: [:show, :destroy]
    resources :nacionalities, except: [:show, :destroy]
    resources :neighborhoods, except: [:show, :destroy]
    resources :occupations, except: [:show, :destroy]
    resources :payment_methods, except: [:show, :destroy]
    resources :relationships, except: [:show, :destroy]
    resources :states, except: [:show, :destroy] do
      resources :cities, only: [:index]
    end
    resources :suppliers, except: [:show, :destroy]
    resources :tax_conditions, except: [:show, :destroy]
    resources :workgroups, except: [:show, :destroy]
  end

  root to: redirect('/users/sign_in')
end
