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
    #添加用户管理
    resources :users do
      #自定义命名controller
      resource :profile, :controller => "user_profiles"
    end
  end

  #与resources：user相比，单数路由少了index action，并且地址上不会有id，路由方法也都是单数
  #不需要参数，eg：user_path，edit_user_paths
  resource :user

end
