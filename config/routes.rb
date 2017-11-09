# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :gridion do
    resources :work_orders, only: %i[index show]
    resources :sequencing_runs, :qcs, :library_preparations

    get 'reception', to: 'reception#index'
    post 'reception/upload', to: 'reception#upload'

    root 'work_orders#index'

  end

  resources :print_jobs, only: %i[create]

  root 'gridion/work_orders#index'

  match 'test_exception_notifier', controller: 'application',
                                   action: 'test_exception_notifier', via: :get


end
