require 'sidekiq/web'

Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  resources :leads

  resources :sales_contacts

  devise_for :users
  mount Workflow::Engine => "/workflow", as: "workflow"
  root to: 'workflow/operations#index'
end