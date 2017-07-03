Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'welcome#index'
  root 'test_reports#index'
  resources :test_reports

  namespace :admin do
    resources :test_reports do
      collection do
        post :import_excel
      end
    end
  end
end
