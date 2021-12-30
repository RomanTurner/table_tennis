Rails.application.routes.draw do
  root 'leads#index'
  resources :lists do
    collection { patch 'bulk_update' }
  end
  resources :leads
  resources :list_leads
end
